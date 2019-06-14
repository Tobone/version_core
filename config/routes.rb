VersionCore::Engine.routes.draw do
  get 'versions' => 'versions#check'
end