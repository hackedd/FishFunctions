function visite --description "Edit a site in apache2 sites-available"
  sudo vi /etc/apache2/sites-available/$argv[1]
end
