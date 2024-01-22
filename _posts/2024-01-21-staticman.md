---
layout: single
title:  staticman
date:   2024-01-21 15:22:09 +0100
categories: Informatique
toc: true
toc_label: "Contenu"
toc_sticky: true
---

# Comments for static sites #


{% picture logostaticman.png --alt staticman logo %}

## staticman ##

I recently considered adding comments to my blog and after considering several alternatives (as [disqus](https://disqus.com/) for instance) I decided to choose [staticman](https://staticman.net) due to its open source nature and also because it keeps all the comments in your repository on GitHub and doesn't save them on a distant third party private server.  

Staticman is a JavaScript application which takes care of the user submitted content and transforms it in data to be strored in a sub directory of the blog repo on GitHub through a pull request. This contrent must be accepted or is automagically rendered according to the value of a moderation option.  

I found the documentation confusing regarding the first steps of the installation and that's the reason why I decided to make it more explicit.

**N.B.** Staticman needs a blog (or a static site) hosted by GitHub (on the GithHub pages like the one you read, GitLab or Netlify) in order to work properly. Moreover this post focuses on a Jekyll blog; hence you'll have to adapt the settings if you use Hugo or another static site generator, but the process might be similar. I suppose that you're familiar with both the command line and your shell. I use *Bash* .
 
## Building a new instance ##

To begin, one have to create a new GitHub account to fork the [staticman repository](https://github.com/eduardoboucas/staticman) with a name reflecting its function (we'll call it *bot-count*) and set a Personnel Access Token from this account (*Settings >> Developer settings >> PAT >> Generate New Token*) without expiration date but with an expressive name (something like  &#171;staticman PAT&#187;). This PAT must have repos and user privileges in order to work and you have to write it down somewhere for later use.  
Then back to the blog's repository where we have to add the staticman count as a contributor with write access (*Settings >> Manage Access >> Add bot-count >> Choose Role >> write*). Once  this is done, we have to build an instance of the application on line for the collaboration to be granted. The documentation is not up to date and is about free tiers on Heroku which don't exist anymore.  

I choosed the free offer of [cyclic.sh](https://www.cyclic.sh/) where I had to log in with the staticman bot account (*bot-count*) on GitHub. The configuration was straightforward but there's some variables that needed to be set we shall see in the following. I called this instance fairly trivially *staticman.cyclic.app* (for this I had to set a subdomain to rename the app in the dashboard) but we'll call it *staticman_instance* afterwards.

- First we  clone locally the staticman repository previously cloned in our bot-count on GitHub : `git clone https://github.com/bot-count/staticman.git; cd staticman`. Then one must erase the `package-lock.json` and launch `npm install` to use it with a recent npm version. The staticman files are a bit outdated and we encountered a bunch of warnings at this stage. I had to issue a  `npm audit fix` command to supress some of them.

- We generate an RSA keypair to encrypt all the information used by Staticman (emails, reCAPTCHA) with an empty passphrase :  
{% highlight shell_session %}
ssh-keygen -m PEM -t rsa -b 4096 -C "staticman key" -f ~/.ssh/staticman_key
{% endhighlight %}
-  We create a file `Procfile` containing the line `web: npm start` in the repository'root.
-  Then, a file named `config.production.json`  at the same place :

```
echo '{
   "githubToken": process.env.GITHUB_TOKEN,
   "rsaPrivateKey": JSON.stringify(process.env.RSA_PRIVATE_KEY),
   "port": process.env.PORT
 }' > config.production.json
```
The `process.env` syntax is for our production application to fetch these values saved on cyclic.sh.
- Our configuration file *must not* be ignored by git so :

```
echo -e "\n\!config.production.json" >> .gitignore
```
To deploy the application to cyclic.sh we add all the changes (`git add -A`), commit and push to GitHub our modified version of the repository. This triggers the application's deployement on cyclic.sh   

On the cyclic.sh site we go to the dashboard of our application, on the &#171;Variables&#187; tab and we set the `GITHUB_TOKEN` one with the PAT generated previously on our bot-count. Then, we have to re write the RSA key  to dismiss the new lines characters :

```
cat ~/.ssh/staticman_key | tr -d '\n' 
```

and copy the result (including `-----BEGIN RSA PRIVATE_KEY` and `END RSA PRIVATE KEY-----`) in a newly crafted variable named `RSA_PRIVATE_KEY`.  

For security sake and to reflect my `config.production.json` file (but I don't know if it's really necessary) I defined also a `PORT` variable and set it to 3000.  

After that we can manually trigger a new deploy to be sure that the app's working. For checking purpose, connect to *https://staticman_instance.cyclic.app* and you should see  &#171;Hello from Staticman version 3.0.0!&#187; displayed.

## Collaborator acceptance ##
Do you remember what we did on GitHub to declare the staticman bot as a contributor to our blog repository ? To finalize this point we have to issue a *GET* request to our staticman instance so in the adress bar of our browser, we write  : *https://staticman_instance.cyclic.app/v2/connect/your-user-name-on-github/your-blog-repository-on-github* and if all went well we will be rewarded by a simple  &#171; OK! &#187;

## Jekyll configuration ##

As I use the brilliant [minimal mistakes](https://mmistakes.github.io/minimal-mistakes/) theme, I had to set up some details inside Jekyll and this theme's particular configuration files.  

First, we place a `staticman.yml` in the root's folder of the jekyll's site with this settings :
{% highlight shell_session %}
comments:
  allowedFields : ["name", "email", "message"]
  branch        : "master"
  commitMessage : "Nouveau commentaire de {fields.name}"
  filename      : "comment-{@timestamp}"
  format        : "yaml"
  moderation    : true 
  path          : "_data/comments/{options.slug}"
  requiredFields : ["name", "email", "message"]
  transforms: 
    email: md5
  generatedFields :
    date:
      type: date
      options: 
      format: iso8601
  akismet:
    enabled: true
    author: name
    authorEmail: email
    authorUrl: url
    content: message
    type: comment
  reCaptcha:
    enabled: true
    siteKey: <moderatly_long_key>
    secret: <very_long_key>
{% endhighlight %}

Note the  &#171; moderation: true  &#187; line.  

As we can see there's an askimet and a reCAPTCHA keys involved. More on that later.  
In the Jekyll's general configuration file `_config.yml` we have to set the following :
{% highlight shell_session %}
...
long_date_format         : "%d %B %Y à %H:%M"
...
comments:
  provider               : "staticman_v2"
  staticman:
    branch               : "master"
    endpoint             : "https://staticman_instance.cyclic.app/v2/entry/"
reCaptcha:
  siteKey                : <moderatly_long_key>
  secret                 : <very_long_key>
  theme                  : "light"
  ...
{% endhighlight %}
and that's all for this file. You can notice here that I use staticman version 2 and not the version 3. It's because I realised that the latest doesn't work when we take the path of GitHub PAT but is tailored to [GitHub applications](https://docs.github.com/en/apps/creating-github-apps/about-creating-github-apps/about-creating-github-apps) and the use of webhooks.  

## spam protection ##
As we saw in the last section you better have to set up some basic spam protection when you allow comments on your pages. I won't describe all the steps to add a reCAPTCHA to your site from your [Google's developper](https://developers.google.com/) account (the minimal mistakes theme allows only the reCAPTCHA version 2) or the way to subscribe to a free, non commercial [ASKIMET](https://akismet.com/) account.  
In this post context you just have to know how to make your blog and your Staticman instance aware of these devices parameters (yes, we're talking about  the previous *very_long_key* thing).  

Regarding Akismet You just have to create two more variables on the static.sh dashboard , *ASKIMET_SITE*, *ASKIMET_API_KEY* and set them respectively to your blog site and the API key given by Akismet.  
The reCAPTCHA key obtained at the Google's developer site must be encrypted with the RSA private key to produce our *very_long_key*. To do so, issue a get request to *https://staticman_instance/v2/encrypt/your-recaptcha-secret-key* and on the displayed page you'll see this *very_long_key* that you have to declare in the two configuration files as described above.

## Displaying comments ##

To integrate comments and forms into the general design of the minimal mistakes theme we have to download the [`_include/comments.html`](https://github.com/mmistakes/minimal-mistakes/blob/master/_includes/comments.html), put it in its folder and make the following changes to the `_include/comment.html` file (to match the french way to diplay dates) :  
- at the very top of the file : 
{% highlight liquid %}
{% raw %}{% assign long_date_format = site.long_date_format | default : "%-d %B,%Y à %H:%M" %}{% endraw %}
{% endhighlight %}
- change the line number 7 to : 
{% highlight liquid %}
{% raw %}{% unless include.url == nil or include.url == empty or include.url == "" %}{% endraw %}
{% endhighlight %}
- and the line number 16 to :
{% highlight liquid %}
 {% raw %}<time datetime="{{ include.date | date_to_xmlschema }}" itemprop="datePublished">{{ include.date | date: long_date_format }}</time>{% endraw %}
{% endhighlight %}
It's worth mentionning that the comments are disabled in development mode for Jekyll sites. If we want to experiment we have to :  

- prepend `JEKYLL_ENV=production` to `bundle exec jekyll serve` 
- and put  &#171;`comments: true` &#187; in the front matter of the post inside which we wish to allow the users to comment.  

That's all ! Happy commenting with staticman.

## References ##
1. [The average Linux user](https://averagelinuxuser.com/staticman-comments/)
2. [Setting up Staticman comments on my Jekyll GitLab page](https://nithiya.gitlab.io/post/staticman-jekyll-gitlab/)
3. [Staticman documentation](https://staticman.net/docs/)
