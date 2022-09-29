---
layout: single
title: Contact
permalink: /contact/
---

<form accept-charset="UTF-8" action="https://getform.io/f/3a6b24e7-b1e7-40f9-9dcc-74c5b66a1836" method="POST" enctype="multipart/form-data" target="_blank">
          <div class="form-group">
            <label for="InputEmail1" required="required">Adresse Mail</label>
            <input type="email" name="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Entrez votre email">
          </div>
          <div class="form-group">
            <label for="exampleInputName">Nom</label>
            <input type="text" name="name" class="form-control" id="exampleInputName" placeholder="Entrez votre Nom" required="required">
          </div>
          <div class="form-group">
            <label for="FormControlSelectDemande">Quelle est la nature de votre demande ?</label>
            <select class="form-control" id="FormControlSelectDemande" name="Demande" required="required">
              <option>Site Vitrine</option>
              <option>Site e-commerce</option>
              <option>Application</option>
			  <option>Autre</option>
            </select>
          </div>
          <hr>
          <div class="form-group mt-3">
            <label class="mr-2">Vous pouvez joindre un fichier texte explicitant votre demande :</label>
            <input type="file" name="file">
          </div>
          <hr>
          <button type="submit" class="btn btn-primary">Soumettre</button>
        </form>
