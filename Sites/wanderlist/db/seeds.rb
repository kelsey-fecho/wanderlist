users_list = {
  "jane_villanueva" => {
    :email => "janethevirgin@show.com",
    :password => "mateo4ever"
  },
  "xo_villanueva" => {
    :email => "xiomara@show.com",
    :password => "shakira123"
  },
  "petra_solano" => {
    :email => "natalia@show.com",
    :password => "nomoremilos"
  },
  "rafael_solano" => {
    :email => "marbella@show.com",
    :password => "MateoAnnaElsa"
  },
  "alba_villanueva" => {
    :email => "grandma@show.com",
    :password => "vivavenezuela"
  },
  "rogelio_de_la_vega" => {
    :email => "therealrogelio@show.com",
    :password => "rogeliobrogelio"
  },
  "michael_cordero" => {
    :email => "detectivecordero@show.com",
    :password => "jane4ever"
  }
}

users_list.each do |name, user_hash|
  u = User.new
  u.username = name
  user_hash.each do |att, val|
    u[att] = val
  end
  u.save
end
