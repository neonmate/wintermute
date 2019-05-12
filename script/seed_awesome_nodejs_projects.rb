# https://github.com/sqreen/awesome-nodejs-projects

user = User.find_by(nickname: 'neonmate')

ActiveRecord::Base.transaction do
  Project.create!(
    title: 'Keystone',
    subtitle: 'The open source framework for developing database-driven websites, applications and APIs. Built on Express and MongoDB.',
    repository_url: 'https://github.com/keystonejs/keystone',
    description: 'The open source framework for developing database-driven websites, applications and APIs. Built on Express and MongoDB.',
    user: user,
  )

  Project.create!(
    title: 'Pencilblue',
    subtitle: 'Business Class Content Management.',
    repository_url: 'https://github.com/pencilblue/pencilblue',
    description: 'Business Class Content Management.',
    user: user,
  )

  Project.create!(
    title: 'Apostrophe',
    subtitle: 'Apostrophe is a CMS framework that supports in-context editing, schema-driven content types, flexible widgets, and much more.',
    repository_url: 'https://github.com/punkave/apostrophe',
    description: 'Apostrophe is a CMS framework that supports in-context editing, schema-driven content types, flexible widgets, and much more.',
    user: user,
  )

  Project.create!(
    title: 'Cody',
    subtitle: 'Javascript Content Management System.',
    repository_url: 'https://github.com/jcoppieters/cody/',
    description: 'Javascript Content Management System.',
    user: user,
  )

  Project.create!(
    title: 'HashBrown',
    subtitle: 'Remote, multilingual, multi-project, multi-environment CMS using customisable content and field schemas.',
    repository_url: 'https://github.com/Putaitu/hashbrown-cms/',
    description: 'Remote, multilingual, multi-project, multi-environment CMS using customisable content and field schemas.',
    user: user,
  )

  Project.create!(
    title: 'Strapi',
    subtitle: 'Open source Node.js ecosystem to build, deploy and manage your own API.',
    repository_url: 'https://github.com/strapi/strapi',
    description: 'Open source Node.js ecosystem to build, deploy and manage your own API.',
    user: user,
  )

  Project.create!(
    title: 'Enduro.js',
    subtitle: 'Minimalistic, flat-file, full-fledged cms that gets your website running in minutes.',
    repository_url: 'https://github.com/Gottwik/enduro',
    description: 'Minimalistic, flat-file, full-fledged cms that gets your website running in minutes.',
    user: user,
  )

  Project.create!(
    title: 'Raneto',
    subtitle: 'Markdown powered Knowledgebase for Nodejs',
    repository_url: 'https://github.com/gilbitron/Raneto',
    description: 'Markdown powered Knowledgebase for Nodejs',
    user: user,
  )

  Project.create!(
    title: 'Shield',
    subtitle: 'Shields badge specification, website and default API server.',
    repository_url: 'https://github.com/badges/shields',
    description: 'Shields badge specification, website and default API server.',
    user: user,
  )

  Project.create!(
    title: 'David-www',
    subtitle: 'David helps keep your project dependencies up to date.',
    repository_url: 'https://github.com/alanshaw/david-www',
    description: 'David helps keep your project dependencies up to date.',
    user: user,
  )

  Project.create!(
    title: 'Atom',
    subtitle: 'Fully hackable text editor using Chrome.',
    repository_url: 'https://github.com/atom/atom',
    description: 'Fully hackable text editor using Chrome.',
    user: user,
  )

  Project.create!(
    title: 'Visual Studio Code',
    subtitle: 'An Electron based text editor created by Microsoft.',
    repository_url: 'https://github.com/Microsoft/vscode',
    description: 'An Electron based text editor created by Microsoft.',
    user: user,
  )

  Project.create!(
    title: 'TellForm',
    subtitle: 'A beautiful and powerful self-hostable Form and Survey builder similar to Typeform or Google Forms.',
    repository_url: 'https://github.com/whitef0x0/tellform',
    description: 'A beautiful and powerful self-hostable Form and Survey builder similar to Typeform or Google Forms.',
    user: user,
  )

  Project.create!(
    title: 'JSON-server',
    subtitle: 'Get a full fake REST API with zero coding in less than 30 seconds (seriously).',
    repository_url: 'https://github.com/typicode/json-server',
    description: 'Get a full fake REST API with zero coding in less than 30 seconds (seriously).',
    user: user,
  )

  Project.create!(
    title: 'Mongo-Express',
    subtitle: 'Web-based MongoDB admin interface, written with express.',
    repository_url: 'https://github.com/mongo-express/mongo-express',
    description: 'Web-based MongoDB admin interface, written with express.',
    user: user,
  )

  Project.create!(
    title: 'Eve',
    subtitle: 'Eve is a set of tools to help us think. Currently, these tools include: a temporal query language, a compiler, and a database.',
    repository_url: 'https://github.com/witheve/Eve',
    description: 'Eve is a set of tools to help us think. Currently, these tools include: a temporal query language, a compiler, and a database.',
    user: user,
  )

  Project.create!(
    title: 'Hotel',
    subtitle: 'Start your dev servers from your browser and get local domains in seconds.',
    repository_url: 'https://github.com/typicode/hotel',
    description: 'Start your dev servers from your browser and get local domains in seconds.',
    user: user,
  )
  Project.create!(
    title: 'Hackathon Starter',
    subtitle: 'A boilerplate for Node.js web applications.',
    repository_url: 'https://github.com/sahat/hackathon-starter',
    description: 'A boilerplate for Node.js web applications.',
    user: user,
  )

  Project.create!(
    title: 'Node-RED',
    subtitle: 'A visual tool for wiring the Internet of Things',
    repository_url: 'https://github.com/node-red/node-red',
    description: 'A visual tool for wiring the Internet of Things',
    user: user,
  )

  Project.create!(
    title: 'nscm',
    subtitle: 'An open-source CLI tool for working with NodeSource Certified Modules',
    repository_url: 'https://github.com/nodesource/nscm',
    description: 'An open-source CLI tool for working with NodeSource Certified Modules',
    user: user,
  )

  Project.create!(
    title: 'Ghost',
    subtitle: 'A simple, powerful publishing platform.',
    repository_url: 'https://github.com/TryGhost/Ghost',
    description: 'A simple, powerful publishing platform.',
    user: user,
  )

  Project.create!(
    title: 'Mean-Blog',
    subtitle: 'Blog using Expressjs, Angularjs and Mongodb. MEAN Javascript Fullstack application.',
    repository_url: 'https://github.com/DimitriMikadze/Mean-Blog',
    description: 'Blog using Expressjs, Angularjs and Mongodb. MEAN Javascript Fullstack application.',
    user: user,
  )

  Project.create!(
    title: 'Hexo',
    subtitle: 'A fast, simple & powerful blog framework.',
    repository_url: 'https://github.com/hexojs/hexo',
    description: 'A fast, simple & powerful blog framework.',
    user: user,
  )

  Project.create!(
    title: 'Reptar',
    subtitle: 'Powerful, modern, and flexible static site generator.',
    repository_url: 'https://github.com/reptar/reptar',
    description: 'Powerful, modern, and flexible static site generator.',
    user: user,
  )

  Project.create!(
    title: 'Cloud Commander',
    subtitle: 'Orthodox web file manager with console and editor.',
    repository_url: 'https://github.com/coderaiser/cloudcmd',
    description: 'Orthodox web file manager with console and editor.',
    user: user,
  )

  Project.create!(
    title: 'Mediacenterjs',
    subtitle: 'A HTML/CSS/Javascript based Media center.',
    repository_url: 'https://github.com/jansmolders86/mediacenterjs',
    description: 'A HTML/CSS/Javascript based Media center.',
    user: user,
  )

  Project.create!(
    title: 'Habitica',
    subtitle: 'A habit tracker app which treats your goals like a Role Playing Game.',
    repository_url: 'https://github.com/HabitRPG/habitica',
    description: 'A habit tracker app which treats your goals like a Role Playing Game.',
    user: user,
  )

  Project.create!(
    title: 'moeda',
    subtitle: 'A foreign exchange rates and currency conversion using cli.',
    repository_url: 'https://github.com/thompsonemerson/moeda',
    description: 'A foreign exchange rates and currency conversion using cli.',
    user: user,
  )

  Project.create!(
    title: 'TimeOff Management',
    subtitle: 'Simple yet powerful absence management software for small and medium size business.',
    repository_url: 'https://github.com/timeoff-management/application',
    description: 'Simple yet powerful absence management software for small and medium size business.',
    user: user,
  )

  Project.create!(
    title: 'Gadael',
    subtitle: 'Leave management software with french work regulations support.',
    repository_url: 'https://github.com/gadael/gadael',
    description: 'Leave management software with french work regulations support.',
    user: user,
  )

  Project.create!(
    title: 'Basic Hospital Information Management Application',
    subtitle: 'Hospital management suite for the developing world.',
    repository_url: 'https://github.com/IMA-WorldHealth/bhima-2.X',
    description: 'Hospital management suite for the developing world.',
    user: user,
  )

  Project.create!(
    title: 'Agile GPS',
    subtitle: 'Real-time fleet tracking software',
    repository_url: 'https://github.com/llambda/agilegps',
    description: 'Real-time fleet tracking software',
    user: user,
  )

  Project.create!(
    title: "NASA's Open MCT",
    subtitle: 'A web based mission control framework.',
    repository_url: 'https://github.com/nasa/openmct',
    description: 'A web based mission control framework.',
    user: user,
  )

  Project.create!(
    title: 'PokéDex Go Messenger Bot',
    subtitle: 'A Pokédex Messenger Bot for Pokémon Go to easily find Pokémon and their strenghts & weaknesses.',
    repository_url: 'https://github.com/zwacky/pokedex-go',
    description: 'A Pokédex Messenger Bot for Pokémon Go to easily find Pokémon and their strenghts & weaknesses.',
    user: user,
  )

  Project.create!(
    title: 'System Discord Bot',
    subtitle: 'A Moderative and user-friendly Discord bot.',
    repository_url: 'https://github.com/shiigehiro/System',
    description: 'A Moderative and user-friendly Discord bot.',
    user: user,
  )

  Project.create!(
    title: 'Countly',
    subtitle: 'Open source, mobile & web analytics and marketing platform for Android, iOS and web.',
    repository_url: 'https://github.com/countly/countly-server',
    description: 'Open source, mobile & web analytics and marketing platform for Android, iOS and web.',
    user: user,
  )
end
