# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<% if user_signed_in? %>
      <%= link_to 'Sair', destroy_user_session_path, method: :delete, data: { confirm: 'Tem certeza que deseja sair?' } %>
    <% end %>