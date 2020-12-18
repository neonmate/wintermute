every 3.hours do
  rake 'background:synchronize_repositories'
  rake 'background:import_hn_items'
end
