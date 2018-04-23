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
  u = User.new(user_hash)
  u.username = name
  u.save
end

destination_list = {
  "Havana" => {
    :description => "Havana is Cuba’s capital city. Spanish colonial architecture in its 16th-century Old Havana core includes the Castillo de la Real Fuerza, a fort and maritime museum. The National Capitol Building is an iconic 1920s landmark. Also in Old Havana is the baroque Catedral de San Cristóbal and Plaza Vieja, whose buildings reflect the city’s vibrant architectural mix."
  },
  "Grenada" => {
    :description => "Grenada, known as Spice Island, remains one of the Caribbean’s under-the-radar gems, even though it’s got what every traveler wants: uncrowded beaches, preserved rain forests, and a lively local culture and cuisine."
  },
  "Buenos Aires" => {
    :description => "This year, Buenos Aires becomes a hub for art, sports, and politics: the inaugural Art Basel Cities program, the Youth Olympic Games, and the G20 will all take place in the city, beginning with the multi-year Art Basel initiative."
  },
  "Los Cabos" => {
    :description => "Located at the tip of the Baja Peninsula, the two small colonial towns of Cabo San Lucas and San José del Cabo have become the hottest vacation destinations in Mexico in recent years."
  },
  "Walla Walla Valley" => {
    :description => "Walla Walla has come into its own as the next must-visit destination for oenophiles, golfers, and cyclists. With more than 140 wineries producing European-style Syrahs, Cabernets, and Merlots, there’s no shortage of tasting rooms in the valley, which hosts four weekend-long wine events each year."
  },
  "Uzbekistan" => {
    :description => "Although the former Soviet republic might seem remote, Uzbekistan once sat at the very center of the world. In the first millennium, no traveler could pass from Asia to Europe without stopping in the Silk Road strongholds of Bukhara and Samarkand, and as a result these cities evolved into rich cultural centers."
  },
  "Egypt" => {
    :description => "Political strife and economic woes have taken a toll on Egypt’s tourism industry in recent years, but travelers will soon have a new reason to visit. On the arid plains of Giza not far from the Great Pyramids, a modern monument is under construction that’s more than two decades and nearly $1 billion in the making."
  },
  "Marrakesh" => {
    :description => "The Moroccan city has attracted an artistic crowd since the 1960s, when everyone from Yves Saint Laurent to Mick Jagger fell for its vibrant sensory landscape. Now the city’s cultural scene is being reinvigorated, thanks to two landmark happenings in the world of art and design."
  },
  "Fiji" => {
    :description => "It’s no secret that Fiji is home to some of the world’s most spectacular scenery — powdery beaches fringed with palms, crystalline waters with colorful reefs, and rugged coastlines covered in greenery. But the islands’ new crop of luxury accommodations is making a case for the archipelago’s man-made phenomena as well."
  },
  "Albuquerque" => {
    :description => "Rising above its associations with the annual hot-air-balloon festival, Albuquerque will this year set out to prove itself as a fully-fledged destination. The Sawmill District, just north of the historic Old Town, is being revived as a creative center, anchored by the arrival of the Hotel Chaco."
  },
  "Zambia" => {
    :description => "Until now, Zambia has had little recognition as one of Africa’s great safari destinations. Yet experts know it as the birthplace of the walking safari — as well as the home of some of the most highly trained guides on the continent."
  },
  "Archipelago Sea" => {
    :description => "Finland’s Archipelago Sea is the world’s largest, with 25,000 miles of shoreline and innumerable islands. Still off the beaten track for international tourists, who gravitate toward Helsinki in summer and Lapland in winter, the archipelago is the well-kept secret of the Finns, generations of whom flock to family-owned islands."
  },
  "Iguazu Falls" => {
    :description => "To better accommodate the millions who visit Iguazú Falls, a UNESCO site of 275 mighty waterfalls straddling the border of Argentina and Brazil, nearby Cataratas del Iguazú Airport is being modernized and enlarged."
  },
  "Salina Island" => {
    :description => "Of all the islands that make up Italy’s Aeolian archipelago, Salina is arguably the most alluring: it is not yet a celebrity haven like its neighbor Stromboli, where Giorgio Armani, Domenico Dolce, and Stefano Gabbana have homes; and it’s not yet overrun with the luxury yachts of affluent soccer players like nearby Panarea."
  }
}

destination_list.each do |name, dest_hash|
  d = Destination.new(dest_hash)
  d.name = name
  d.save
end
