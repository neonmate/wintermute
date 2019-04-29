# https://github.com/unicodeveloper/awesome-opensource-apps

user = User.find_by(nickname: 'neonmate')

ActiveRecord::Base.transaction do
  Project.create!(
    title: 'AbuseIO',
    subtitle: 'Abuse Management for network operators',
    description: 'Abuse Management for network operators',
    repository_url: 'https://github.com/AbuseIO/AbuseIO',
    application_url: 'https://abuse.io',
    user: user,
  )

  Project.create!(
    title: 'Admin Architect',
    subtitle: 'Administration Framework. Active Admin for Laravel',
    description: 'Administration Framework. Active Admin for Laravel',
    repository_url: 'https://github.com/adminarchitect/core',
    application_url: 'http://adminarchitect.com',
    user: user,
  )

  Project.create!(
    title: 'Akaunting',
    subtitle: 'Free and Online Accounting Software',
    description: 'Free and Online Accounting Software',
    repository_url: 'https://github.com/akaunting/akaunting',
    application_url: 'https://akaunting.com',
    user: user,
  )

  Project.create!(
    title: 'Laracom',
    subtitle: 'FREE E-Commerce Software',
    description: 'FREE E-Commerce Software',
    repository_url: 'https://github.com/jsdecena/laracom',
    application_url: 'https://laracom.net',
    user: user,
  )

  Project.create!(
    title: 'Invoice Ninja',
    subtitle: 'Invoice Generation System',
    description: 'Invoice Generation System',
    repository_url: 'https://github.com/invoiceninja/invoiceninja',
    application_url: 'https://www.invoiceninja.com',
    user: user,
  )

  Project.create!(
    title: 'Koel',
    subtitle: 'A personal music streaming server that works',
    description: 'A personal music streaming server that works',
    repository_url: 'https://github.com/phanan/koel',
    application_url: 'http://koel.phanan.net',
    user: user,
  )

  Project.create!(
    title: 'Faveo',
    subtitle: 'Helpdesk Ticketing System',
    description: 'Helpdesk Ticketing System',
    repository_url: 'https://github.com/ladybirdweb/faveo-helpdesk',
    application_url: 'http://www.faveohelpdesk.com',
    user: user,
  )

  Project.create!(
    title: 'Timegrid',
    subtitle: 'Online Reservation Platform',
    description: 'Online Reservation Platform',
    repository_url: 'https://github.com/timegridio/timegrid',
    application_url: 'https://demo.timegrid.io',
    user: user,
  )

  Project.create!(
    title: 'Laravel.io',
    subtitle: 'Laravel Community Portal',
    description: 'Laravel Community Portal',
    repository_url: 'https://github.com/laravelio/laravel.io',
    application_url: 'http://laravel.io',
    user: user,
  )

  Project.create!(
    title: 'Laravel Tricks',
    subtitle: 'Laravel Tips and Tricks',
    description: 'Laravel Tips and Tricks',
    repository_url: 'https://github.com/CodepadME/laravel-tricks',
    application_url: 'http://laravel-tricks.com',
    user: user,
  )

  Project.create!(
    title: 'Attendize',
    subtitle: 'Ticket selling and event management platform',
    description: 'Ticket selling and event management platform',
    repository_url: 'https://github.com/Attendize/Attendize',
    application_url: 'https://www.attendize.com',
    user: user,
  )

  Project.create!(
    title: 'Laraadmin',
    subtitle: 'CRM for quickstart Admin based applications',
    description: 'CRM for quickstart Admin based applications',
    repository_url: 'https://github.com/dwijitsolutions/laraadmin',
    application_url: 'http://laraadmin.com',
    user: user,
  )

  Project.create!(
    title: 'Larasites',
    subtitle: 'Showcasing the best websites made with Laravel & Lumen',
    description: 'Showcasing the best websites made with Laravel & Lumen',
    repository_url: 'https://github.com/we-are-next/larasites.com',
    application_url: 'https://www.larasites.com',
    user: user,
  )

  Project.create!(
    title: 'Openlaravel',
    subtitle: 'A collection of open source projects built using Laravel',
    description: 'A collection of open source projects built using Laravel',
    repository_url: 'https://github.com/ammezie/openlaravel',
    application_url: 'http://openlaravel.com',
    user: user,
  )

  Project.create!(
    title: 'Flarum',
    subtitle: 'Delightfully simple forum software',
    description: 'Delightfully simple forum software',
    repository_url: 'https://github.com/flarum/flarum',
    application_url: 'http://flarum.org',
    user: user,
  )

  Project.create!(
    title: 'OctoberCMS',
    subtitle: 'CMS platform built on Laravel',
    description: 'CMS platform built on Laravel',
    repository_url: 'https://github.com/octobercms/october',
    application_url: 'http://octobercms.com',
    user: user,
  )

  Project.create!(
    title: 'PyroCMS',
    subtitle: 'PHP CMS',
    description: 'PHP CMS',
    repository_url: 'https://github.com/pyrocms/pyrocms',
    application_url: 'https://www.pyrocms.com',
    user: user,
  )

  Project.create!(
    title: 'LavaliteCMS',
    subtitle: 'CMS built on Laravel 5.2',
    description: 'CMS built on Laravel 5.2',
    repository_url: 'https://github.com/LavaLite/cms',
    application_url: 'http://www.lavalite.org',
    user: user,
  )

  Project.create!(
    title: 'AsgardCMS',
    subtitle: 'A modular multilingual CMS built with Laravel 5',
    description: 'A modular multilingual CMS built with Laravel 5',
    repository_url: 'https://github.com/AsgardCms/Platform',
    application_url: 'http://asgardcms.com',
    user: user,
  )

  Project.create!(
    title: 'WardRobeCMS',
    subtitle: 'A minimal blogging application',
    description: 'A minimal blogging application',
    repository_url: 'https://github.com/wardrobecms/wardrobe',
    application_url: 'http://wardrobecms.com',
    user: user,
  )

  Project.create!(
    title: 'KodiCMS',
    subtitle: 'The CMS built on Laravel 5.2',
    description: 'The CMS built on Laravel 5.2',
    repository_url: 'https://github.com/KodiCMS/kodicms-laravel',
    application_url: 'http://laravel.kodicms.ru',
    user: user,
  )

  Project.create!(
    title: 'MicroweberCMS',
    subtitle: 'Drag and Drop CMS and online shop',
    description: 'Drag and Drop CMS and online shop',
    repository_url: 'https://github.com/microweber/microweber',
    application_url: 'https://microweber.com',
    user: user,
  )

  Project.create!(
    title: 'BoostrapCMS',
    subtitle: 'A PHP CMS powered by Laravel 5 and Sentry',
    description: 'A PHP CMS powered by Laravel 5 and Sentry',
    repository_url: 'https://github.com/BootstrapCMS/CMS',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'TypiCMS',
    subtitle: 'Multilingual and modular CMS built with Laravel 5.2',
    description: 'Multilingual and modular CMS built with Laravel 5.2',
    repository_url: 'https://github.com/TypiCMS/Base',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'FullyCMS',
    subtitle: 'Multi Language Content Management System',
    description: 'Multi Language Content Management System',
    repository_url: 'https://github.com/sseffa/fullycms',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'FlarepointCRM',
    subtitle: 'Self-hosted CRM platform built with Laravel 5',
    description: 'Self-hosted CRM platform built with Laravel 5',
    repository_url: 'https://github.com/Bottelet/Flarepoint-crm',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Quarx',
    subtitle: 'A CMS for Laravel Apps',
    description: 'A CMS for Laravel Apps',
    repository_url: 'https://github.com/YABhq/Quarx',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Oez',
    subtitle: 'Lightweight Blogging CMS',
    description: 'Lightweight Blogging CMS',
    repository_url: 'https://github.com/gaaarfild/0ez',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Airflix',
    subtitle: 'A near-netflix Clone',
    description: 'A near-netflix Clone',
    repository_url: 'https://github.com/wells/airflix',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Antvel',
    subtitle: 'Laravel eCommerce',
    description: 'Laravel eCommerce',
    repository_url: 'https://github.com/ant-vel/App',
    application_url: 'http://antvel.com',
    user: user,
  )

  Project.create!(
    title: 'LaraShop',
    subtitle: 'A Simple PHP Shop CMS',
    description: 'A Simple PHP Shop CMS',
    repository_url: 'https://github.com/ZENLIX/LaraShop',
    application_url: 'http://it-toys.com',
    user: user,
  )

  Project.create!(
    title: '92five',
    subtitle: 'Self-hosted Project Management App',
    description: 'Self-hosted Project Management App',
    repository_url: 'https://github.com/chintanbanugaria/92five',
    application_url: 'http://92fiveapp.com',
    user: user,
  )

  Project.create!(
    title: 'Deployer',
    subtitle: 'A free and open source deployment tool',
    description: 'A free and open source deployment tool',
    repository_url: 'https://github.com/REBELinBLUE/deployer',
    application_url: 'http://phpdeployment.org',
    user: user,
  )

  Project.create!(
    title: 'Paperwork',
    subtitle: 'OpenSource note-taking & archiving alternative to Evernote, Microsoft OneNote & Google Keep',
    description: 'OpenSource note-taking & archiving alternative to Evernote, Microsoft OneNote & Google Keep',
    repository_url: 'https://github.com/twostairs/paperwork',
    application_url: 'http://paperwork.rocks',
    user: user,
  )

  Project.create!(
    title: 'Podcastwala',
    subtitle: 'Podcast System',
    description: 'Podcast System',
    repository_url: 'https://github.com/modestkdr/Podcastwala',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Laravel Snippets',
    subtitle: 'A repository of useful code snippets for Laravel PHP framework',
    description: 'A repository of useful code snippets for Laravel PHP framework',
    repository_url: 'https://github.com/basco-johnkevin/laravelsnippets',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Freelancer Notes',
    subtitle: 'Freelancer Notes',
    description: 'Freelancer Notes',
    repository_url: 'https://github.com/porimol/freelancer-notes',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Critter',
    subtitle: 'Mini-twitter-like app',
    description: 'Mini-twitter-like app',
    repository_url: 'https://github.com/msurguy/critterapp',
    application_url: 'http://demos.maxoffsky.com/critter',
    user: user,
  )

  Project.create!(
    title: 'PHPhub',
    subtitle: 'Chinese PHP Community',
    description: 'Chinese PHP Community',
    repository_url: 'https://github.com/summerblue/phphub',
    application_url: 'http://phphub.org',
    user: user,
  )

  Project.create!(
    title: 'Cachet',
    subtitle: 'Open Source Status Page System',
    description: 'Open Source Status Page System',
    repository_url: 'https://github.com/CachetHQ/Cachet',
    application_url: 'https://cachethq.io',
    user: user,
  )

  Project.create!(
    title: 'Ribbbon',
    subtitle: 'A project management system for Artisans',
    description: 'A project management system for Artisans',
    repository_url: 'https://github.com/canvasowl/ribbbon',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Scrumwala',
    subtitle: 'Your very own Scrum/Agile web app for personal use',
    description: 'Your very own Scrum/Agile web app for personal use',
    repository_url: 'https://github.com/modestkdr/Scrumwala',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'SnipeIT',
    subtitle: 'IT Asset/license Management System',
    description: 'IT Asset/license Management System',
    repository_url: 'https://github.com/snipe/snipe-it',
    application_url: 'http://snipeitapp.com',
    user: user,
  )

  Project.create!(
    title: 'Neontsunami',
    subtitle: 'Personal Website and blog',
    description: 'Personal Website and blog',
    repository_url: 'https://github.com/dwightwatson/neontsunami',
    application_url: 'http://www.neontsunami.com',
    user: user,
  )

  Project.create!(
    title: 'Nahid.co',
    subtitle: 'Personal Portfolio and blog project',
    description: 'Personal Portfolio and blog project',
    repository_url: 'https://github.com/nahid/nahid.co',
    application_url: 'http://nahid.co',
    user: user,
  )

  Project.create!(
    title: 'Laramap',
    subtitle: 'A Map of Laravel Developers',
    description: 'A Map of Laravel Developers',
    repository_url: 'https://github.com/laramap/laramap.com',
    application_url: 'https://laramap.com',
    user: user,
  )

  Project.create!(
    title: 'Learn Party',
    subtitle: 'A Dead Simple Learning Management System',
    description: 'A Dead Simple Learning Management System',
    repository_url: 'https://github.com/andela-jkariuki/checkpoint-four-learn-party',
    application_url: 'https://learn-party.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'Techademia',
    subtitle: 'Organize Your Youtube Videos to Learn',
    description: 'Organize Your Youtube Videos to Learn',
    repository_url: 'https://github.com/andela-fokosun/Checkpoint4',
    application_url: 'http://techademia.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'BookStack',
    subtitle: 'A platform to create documentation/wiki content',
    description: 'A platform to create documentation/wiki content',
    repository_url: 'https://github.com/ssddanbrown/BookStack',
    application_url: 'https://www.bookstackapp.com',
    user: user,
  )

  Project.create!(
    title: 'Gruik',
    subtitle: 'An open-source markdown note-taking web app',
    description: 'An open-source markdown note-taking web app',
    repository_url: 'https://github.com/grena/gruik',
    application_url: 'http://gruik.io',
    user: user,
  )

  Project.create!(
    title: 'Laravel.com',
    subtitle: 'Official Website and Documentation of Laravel',
    description: 'Official Website and Documentation of Laravel',
    repository_url: 'https://github.com/laravel/laravel.com',
    application_url: 'https://laravel.com',
    user: user,
  )

  Project.create!(
    title: 'Katana',
    subtitle: 'Laravel static site/blog generator with markdown support',
    description: 'Laravel static site/blog generator with markdown support',
    repository_url: 'https://github.com/themsaid/katana',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'CoasterCMS',
    subtitle: 'Coaster CMS Project',
    description: 'Coaster CMS Project',
    repository_url: 'https://github.com/web-feet/coastercms',
    application_url: 'http://www.coastercms.org',
    user: user,
  )

  Project.create!(
    title: 'Statamic',
    subtitle: 'Flat File CMS',
    description: 'Flat File CMS',
    repository_url: 'https://github.com/statamic',
    application_url: 'https://statamic.com',
    user: user,
  )

  Project.create!(
    title: 'Larasocial',
    subtitle: 'A Social Network Application',
    description: 'A Social Network Application',
    repository_url: 'https://github.com/msalom28/Larasocial',
    application_url: 'http://larasocial.info',
    user: user,
  )

  Project.create!(
    title: 'Aimeos',
    subtitle: 'Ecommerce package for high performance online shops',
    description: 'Ecommerce package for high performance online shops',
    repository_url: 'https://github.com/aimeos/aimeos-laravel',
    application_url: 'https://aimeos.org/Laravel',
    user: user,
  )

  Project.create!(
    title: 'Gitamin',
    subtitle: 'A self-hosted git repository management software',
    description: 'A self-hosted git repository management software',
    repository_url: 'https://github.com/GitaminHQ/Gitamin',
    application_url: 'http://gitamin.com',
    user: user,
  )

  Project.create!(
    title: 'Vuedo',
    subtitle: 'Vuedo is blog platform, built with Laravel and Vue.js.',
    description: 'Vuedo is blog platform, built with Laravel and Vue.js.',
    repository_url: 'https://github.com/vuedo/vuedo',
    application_url: 'https://vuejsfeed.com',
    user: user,
  )

  Project.create!(
    title: 'Condor',
    subtitle: 'Service monitor that watches diverse statuses, and elegantly reports every drift',
    description: 'Service monitor that watches diverse statuses, and elegantly reports every drift',
    repository_url: 'https://github.com/condorrocks/condor',
    application_url: 'https://condor.rocks',
    user: user,
  )

  Project.create!(
    title: 'DevTv',
    subtitle: 'DevTv is your online Video Subscription Platform',
    description: 'DevTv is your online Video Subscription Platform',
    repository_url: 'https://github.com/iamraphson/DEV-TV',
    application_url: 'http://dev-tv.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'SЁCU',
    subtitle: 'SЁCU is a service to create password protected self-destructing data packages and anonymous chat-rooms.',
    description: 'SЁCU is a service to create password protected self-destructing data packages and anonymous chat-rooms.',
    repository_url: 'https://github.com/secusu/secusu',
    application_url: 'https://secu.su/',
    user: user,
  )

  Project.create!(
    title: 'Confomo',
    subtitle: 'A service that facilitates meeting Twitter friends at conferences',
    description: 'A service that facilitates meeting Twitter friends at conferences',
    repository_url: 'https://github.com/mattstauffer/confomo',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'File Manager',
    subtitle: 'A File manager (for CKEditor and TinyMCE) with multi-users support.',
    description: 'A File manager (for CKEditor and TinyMCE) with multi-users support.',
    repository_url: 'https://github.com/UniSharp/laravel-filemanager',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'FlyMyShop',
    subtitle: 'An e-commerce platform for online merchants.',
    description: 'An e-commerce platform for online merchants.',
    repository_url: 'https://github.com/aasisvinayak/flymyshop',
    application_url: 'https://flymyshop.com',
    user: user,
  )

  Project.create!(
    title: 'Laravel GitScrum',
    subtitle: 'GitScrum is a project to help developer team.',
    description: 'GitScrum is a project to help developer team.',
    repository_url: 'https://github.com/renatomarinho/laravel-gitscrum',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'MIT-2014-2015-YEARBOOK',
    subtitle: 'E-YearBook for 2014/2015 UNILAG MIT students',
    description: 'E-YearBook for 2014/2015 UNILAG MIT students',
    repository_url: 'https://github.com/iamraphson/MIT-2014-2015-YEARBOOK',
    application_url: 'http://unilagmitfaces.ml',
    user: user,
  )

  Project.create!(
    title: "Despark's igniCMS",
    subtitle: 'Easy to use featherlight CMS, which provides you with a shortcut to bootstrapping the backend of PHP (Laravel), MySQL based projects.',
    description: 'Easy to use featherlight CMS, which provides you with a shortcut to bootstrapping the backend of PHP (Laravel), MySQL based projects.',
    repository_url: 'https://github.com/despark/igni-core',
    application_url: 'https://despark.com/',
    user: user,
  )

  Project.create!(
    title: 'Voten',
    subtitle: 'Voten.co is a real-time social bookmarking platform for the 21st century',
    description: 'Voten.co is a real-time social bookmarking platform for the 21st century',
    repository_url: 'https://github.com/voten-co/voten',
    application_url: 'https://voten.co',
    user: user,
  )

  Project.create!(
    title: 'Handesk',
    subtitle: 'A Powerful Laravel Help Desk and Lead Management App.',
    description: 'A Powerful Laravel Help Desk and Lead Management App.',
    repository_url: 'https://github.com/BadChoice/handesk',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Multitrust',
    subtitle: 'Latest roles and permission for multi-auth or single-auth.',
    description: 'Latest roles and permission for multi-auth or single-auth.',
    repository_url: 'https://github.com/code4mk/multitrust',
    application_url: 'https://hellolaravel.org/mk/multitrust/',
    user: user,
  )

  Project.create!(
    title: 'VotePen',
    subtitle: 'Online Bookmarking System, Best Alternative to Reddit.',
    description: 'Online Bookmarking System, Best Alternative to Reddit.',
    repository_url: 'https://github.com/VotePen/VotePen',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Helpy',
    subtitle: 'Mobile First Helpdesk Application',
    description: 'Mobile First Helpdesk Application',
    repository_url: 'https://github.com/helpyio/helpy',
    application_url: 'http://helpy.io',
    user: user,
  )

  Project.create!(
    title: 'Coderwall',
    subtitle: 'Professional network for Software',
    description: 'Professional network for Software',
    repository_url: 'https://github.com/coderwall/coderwall-legacy',
    application_url: 'engineers - https://coderwall.com',
    user: user,
  )

  Project.create!(
    title: 'Spina',
    subtitle: 'A beautiful CMS for Rails Developers',
    description: 'A beautiful CMS for Rails Developers',
    repository_url: 'https://github.com/denkGroot/Spina',
    application_url: 'http://www.spinacms.com',
    user: user,
  )

  Project.create!(
    title: 'Help',
    subtitle: 'Small help request system',
    description: 'Small help request system',
    repository_url: 'https://github.com/netguru/help',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'OpenSourceBilling',
    subtitle: 'Beautiful Simple Billing Software',
    description: 'Beautiful Simple Billing Software',
    repository_url: 'https://github.com/vteams/open-source-billing',
    application_url: 'http://opensourcebilling.org',
    user: user,
  )

  Project.create!(
    title: 'Huginn',
    subtitle: 'Agent system that perform tasks online for you',
    description: 'Agent system that perform tasks online for you',
    repository_url: 'https://github.com/cantino/huginn',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Squash',
    subtitle: 'Collection of tools that helps developers find and kill bugs',
    description: 'Collection of tools that helps developers find and kill bugs',
    repository_url: 'https://github.com/SquareSquash/web',
    application_url: 'http://squash.io',
    user: user,
  )

  Project.create!(
    title: 'Eventx',
    subtitle: 'Event Management System without Hassle',
    description: 'Event Management System without Hassle',
    repository_url: 'https://github.com/andela/eventx',
    application_url: 'http://www.eventtx.com',
    user: user,
  )

  Project.create!(
    title: 'Fulcrum',
    subtitle: 'Agile Project Management Tool',
    description: 'Agile Project Management Tool',
    repository_url: 'https://github.com/fulcrum-agile/fulcrum',
    application_url: 'http://wholemeal.co.nz/projects/fulcrum.html',
    user: user,
  )

  Project.create!(
    title: 'SprintApp',
    subtitle: 'Time tracking and Project Management App',
    description: 'Time tracking and Project Management App',
    repository_url: 'https://github.com/macfanatic/SprintApp',
    application_url: 'http://www.sprintapp.com',
    user: user,
  )

  Project.create!(
    title: 'Copycopter',
    subtitle: 'A service for editing the copy text of a Rails application.',
    description: 'A service for editing the copy text of a Rails application.',
    repository_url: 'https://github.com/copycopter/copycopter-server',
    application_url: 'http://copycopter.com',
    user: user,
  )

  Project.create!(
    title: 'Shoop',
    subtitle: 'E-commerce Platform',
    description: 'E-commerce Platform',
    repository_url: 'https://github.com/shoopio/shoop',
    application_url: 'https://shoop.io',
    user: user,
  )

  Project.create!(
    title: 'Codango',
    subtitle: 'Social Network for Coders',
    description: 'Social Network for Coders',
    repository_url: 'https://github.com/andela/codango',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Django-CMS',
    subtitle: 'Easy to use and developer friendly CMS',
    description: 'Easy to use and developer friendly CMS',
    repository_url: 'https://github.com/divio/django-cms',
    application_url: 'http://www.django-cms.org',
    user: user,
  )

  Project.create!(
    title: 'Django-fiber',
    subtitle: "A simple', user-friendly CMS for all your Django projects",
    description: "A simple', user-friendly CMS for all your Django projects",
    repository_url: 'https://github.com/ridethepony/django-fiber',
    application_url: 'http://ridethepony.org',
    user: user,
  )

  Project.create!(
    title: 'Feincms',
    subtitle: 'A Django-based CMS with a focus on extensibility and concise code',
    description: 'A Django-based CMS with a focus on extensibility and concise code',
    repository_url: 'https://github.com/feincms/feincms',
    application_url: 'http://www.feincms.org',
    user: user,
  )

  Project.create!(
    title: 'Mezzanine',
    subtitle: 'CMS framework for Django',
    description: 'CMS framework for Django',
    repository_url: 'https://github.com/stephenmcd/mezzanine',
    application_url: 'http://mezzanine.jupo.org',
    user: user,
  )

  Project.create!(
    title: 'Wagtail',
    subtitle: 'A Django content management system focused on flexibility and user experience',
    description: 'A Django content management system focused on flexibility and user experience',
    repository_url: 'https://github.com/torchbox/wagtail',
    application_url: 'http://wagtail.io',
    user: user,
  )

  Project.create!(
    title: 'Django-leonardo',
    subtitle: 'CMS for everyone, easy to deploy and scale, robust modular system with many packages',
    description: 'CMS for everyone, easy to deploy and scale, robust modular system with many packages',
    repository_url: 'https://github.com/django-leonardo/django-leonardo',
    application_url: 'https://www.leonardo-cms.org',
    user: user,
  )

  Project.create!(
    title: 'Plaid',
    subtitle: 'An app that showcases Material Design',
    description: 'An app that showcases Material Design',
    repository_url: 'https://github.com/nickbutcher/plaid',
    application_url: 'https://play.google.com/store/apps/details?id=io.plaidapp',
    user: user,
  )

  Project.create!(
    title: 'Google I/O Scheduler',
    subtitle: 'Offcial Android app for Google I/O',
    description: 'Offcial Android app for Google I/O',
    repository_url: 'https://github.com/google/iosched',
    application_url: 'https://play.google.com/store/apps/details?id=com.google.samples.apps.iosched',
    user: user,
  )

  Project.create!(
    title: 'Project Frisbee',
    subtitle: 'All GDG content in one place',
    description: 'All GDG content in one place',
    repository_url: 'https://github.com/gdg-x/frisbee',
    application_url: 'https://play.google.com/store/apps/details?id=org.gdg.frisbee.android',
    user: user,
  )

  Project.create!(
    title: 'Wallsplash',
    subtitle: 'Wallsplash is the cutting edge wallpaper app for your device!',
    description: 'Wallsplash is the cutting edge wallpaper app for your device!',
    repository_url: 'https://github.com/mikepenz/wallsplash-android',
    application_url: 'https://play.google.com/store/apps/details?id=com.mikepenz.unsplash',
    user: user,
  )

  Project.create!(
    title: 'Easy Diary',
    subtitle: 'This is a diary application optimized to user experience.',
    description: 'This is a diary application optimized to user experience.',
    repository_url: 'https://github.com/hanjoongcho/aaf-easydiary',
    application_url: 'https://play.google.com/store/apps/details?id=me.blog.korn123.easydiary',
    user: user,
  )

  Project.create!(
    title: 'Easy Photo Map',
    subtitle: 'Easy Photo Map is a photomap application that displays the location of the photo on the map using the location information included in the photo.',
    description: 'Easy Photo Map is a photomap application that displays the location of the photo on the map using the location information included in the photo.',
    repository_url: 'https://github.com/hanjoongcho/aaf-easyphotomap',
    application_url: 'https://play.google.com/store/apps/details?id=me.blog.korn123.easyphotomap',
    user: user,
  )

  Project.create!(
    title: 'Easy Password',
    subtitle: 'A password manager using a single lock pattern for various type passwords management.',
    description: 'A password manager using a single lock pattern for various type passwords management.',
    repository_url: 'https://github.com/hanjoongcho/aaf-easypassword',
    application_url: 'https://play.google.com/store/apps/details?id=io.github.hanjoongcho.easypassword',
    user: user,
  )

  Project.create!(
    title: 'Rocket.Chat',
    subtitle: 'A web chat platform',
    description: 'A web chat platform',
    repository_url: 'https://github.com/RocketChat/Rocket.Chat',
    application_url: 'https://rocket.chat',
    user: user,
  )

  Project.create!(
    title: 'ColourCode',
    subtitle: 'An online colour code app',
    description: 'An online colour code app',
    repository_url: 'https://github.com/tamino-martinius/colourco.de',
    application_url: 'http://www.colourco.de',
    user: user,
  )

  Project.create!(
    title: 'ReactionCommerce',
    subtitle: 'A JavaScript Ecommerce App',
    description: 'A JavaScript Ecommerce App',
    repository_url: 'https://github.com/reactioncommerce/reaction',
    application_url: 'https://reactioncommerce.com',
    user: user,
  )

  Project.create!(
    title: 'CoderMania',
    subtitle: 'An E-Learning Platform',
    description: 'An E-Learning Platform',
    repository_url: 'https://github.com/Elfoslav/codermania',
    application_url: 'http://www.codermania.com',
    user: user,
  )

  Project.create!(
    title: 'Telescope',
    subtitle: 'Lauch Sites Easily',
    description: 'Lauch Sites Easily',
    repository_url: 'https://github.com/TelescopeJS/Telescope',
    application_url: 'http://www.telescopeapp.org',
    user: user,
  )

  Project.create!(
    title: 'Loop Pulse',
    subtitle: 'Data Analysis Platform',
    description: 'Data Analysis Platform',
    repository_url: 'https://github.com/clionelabs/looppulse.web.manage',
    application_url: 'http://www.looppulse.com',
    user: user,
  )

  Project.create!(
    title: 'Wekan',
    subtitle: 'The open-source Trello-like kanban',
    description: 'The open-source Trello-like kanban',
    repository_url: 'https://github.com/wekan/wekan',
    application_url: 'https://wekan.io/',
    user: user,
  )

  Project.create!(
    title: 'microapps-donation',
    subtitle: 'A single page application that allows people to donate money',
    description: 'A single page application that allows people to donate money',
    repository_url: 'https://github.com/iamraphson/microapps-donation',
    application_url: 'https://microapp-donation.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'docue',
    subtitle: 'Document Management System With React Frontend',
    description: 'Document Management System With React Frontend',
    repository_url: 'https://github.com/kevgathuku/docue',
    application_url: 'https://docue.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'MERNMAP',
    subtitle: 'An interactive map for MERN(MongoDB, ExpressJS, ReactJS, NodeJS) Stack Developers',
    description: 'An interactive map for MERN(MongoDB, ExpressJS, ReactJS, NodeJS) Stack Developers',
    repository_url: 'https://github.com/iamraphson/mernmap',
    application_url: 'http://mernmap.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'Cerebro',
    subtitle: 'One-input productivity booster',
    description: 'One-input productivity booster',
    repository_url: 'https://github.com/KELiON/cerebro',
    application_url: 'http://www.cerebroapp.com',
    user: user,
  )

  Project.create!(
    title: 'Itsquiz-wall',
    subtitle: 'Isomorphic "Quiz Wall" for itsquiz.com',
    description: 'Isomorphic "Quiz Wall" for itsquiz.com',
    repository_url: 'https://github.com/WebbyLab/itsquiz-wall',
    application_url: 'https://itsquiz.com',
    user: user,
  )

  Project.create!(
    title: 'SoundRedux - SoundCloud Client',
    subtitle: 'Isomorphic "Quiz Wall" for itsquiz.com',
    description: 'Isomorphic "Quiz Wall" for itsquiz.com',
    repository_url: 'https://github.com/andrewngu/sound-redux',
    application_url: 'https://soundredux.io',
    user: user,
  )

  Project.create!(
    title: 'React-Powered Hacker News Client',
    subtitle: 'React-Powered Hacker News Client',
    description: 'React-Powered Hacker News Client',
    repository_url: 'https://github.com/insin/react-hn',
    application_url: 'https://react-hn.appspot.com',
    user: user,
  )

  Project.create!(
    title: 'Calypso',
    subtitle: 'The new JavaScript- and API-powered WordPress.com',
    description: 'The new JavaScript- and API-powered WordPress.com',
    repository_url: 'https://github.com/Automattic/wp-calypso',
    application_url: 'https://developer.wordpress.com/calypso',
    user: user,
  )

  Project.create!(
    title: 'Trello tribute',
    subtitle: 'A clone of Trello with React and Phoenix',
    description: 'A clone of Trello with React and Phoenix',
    repository_url: 'https://github.com/bigardone/phoenix-trello',
    application_url: 'https://phoenix-trello.herokuapp.com',
    user: user,
  )

  Project.create!(
    title: 'In-Browser Playground',
    subtitle: 'A playground for in-browser interpreters. Built with React/Redux.',
    description: 'A playground for in-browser interpreters. Built with React/Redux.',
    repository_url: 'https://github.com/fatiherikli/fil',
    application_url: 'http://fatiherikli.github.io/fil',
    user: user,
  )

  Project.create!(
    title: 'Spectacle',
    subtitle: 'A React library for Deck/Slide Presentations.',
    description: 'A React library for Deck/Slide Presentations.',
    repository_url: 'https://github.com/FormidableLabs/spectacle',
    application_url: 'http://stack.formidable.com/spectacle',
    user: user,
  )

  Project.create!(
    title: 'Google Map Clustering',
    subtitle: 'A Google Map Clustering Example',
    description: 'A Google Map Clustering Example',
    repository_url: 'https://github.com/istarkov/google-map-clustering-example',
    application_url: 'http://istarkov.github.io/google-map-clustering-example',
    user: user,
  )

  Project.create!(
    title: 'Kinematic',
    subtitle: 'Visual Docker Container Management on Mac & Windows',
    description: 'Visual Docker Container Management on Mac & Windows',
    repository_url: 'https://github.com/docker/kitematic',
    application_url: 'https://github.com/docker/kitematic',
    user: user,
  )

  Project.create!(
    title: 'Perseus',
    subtitle: "Perseus is Khan Academy's new exercise question editor and renderer",
    description: "Perseus is Khan Academy's new exercise question editor and renderer",
    repository_url: 'https://github.com/Khan/perseus',
    application_url: 'http://khan.github.io/perseus',
    user: user,
  )

  Project.create!(
    title: 'Favesound-redux',
    subtitle: 'The SoundCloud Client in React + Redux made with passion!',
    description: 'The SoundCloud Client in React + Redux made with passion!',
    repository_url: 'https://github.com/rwieruch/favesound-redux',
    application_url: 'http://www.robinwieruch.de/the-soundcloud-client-in-react-redux',
    user: user,
  )

  Project.create!(
    title: 'How to GraphQL',
    subtitle: 'The Fullstack Tutorial for GraphQL',
    description: 'The Fullstack Tutorial for GraphQL',
    repository_url: 'https://github.com/howtographql/howtographql',
    application_url: 'https://www.howtographql.com',
    user: user,
  )

  Project.create!(
    title: 'Picatic - Ticketing Selling',
    subtitle: 'Ticketing widget built with create-react-app',
    description: 'Ticketing widget built with create-react-app',
    repository_url: 'https://github.com/picatic/picatic-examples/tree/master/react-checkout',
    application_url: 'http://developer.picatic.com/',
    user: user,
  )

  Project.create!(
    title: 'Github Desktop',
    subtitle: 'Git client on Mac & Windows',
    description: 'Git client on Mac & Windows',
    repository_url: 'https://github.com/desktop/desktop',
    application_url: 'https://desktop.github.com',
    user: user,
  )

  Project.create!(
    title: 'Yahoo Finance',
    subtitle: "iOS's Stocks App clone written in React Native for demo purpose (available both iOS and Android). Data is pulled from Yahoo Finance.",
    description: "iOS's Stocks App clone written in React Native for demo purpose (available both iOS and Android). Data is pulled from Yahoo Finance.",
    repository_url: 'https://github.com/7kfpun/FinanceReactNative',
    application_url: 'https://play.google.com/store/apps/details?id=com.kfpun.finance',
    user: user,
  )

  Project.create!(
    title: 'Pokemon Go Clone',
    subtitle: 'Pokemon Go in React Native.',
    description: 'Pokemon Go in React Native.',
    repository_url: 'https://github.com/VctrySam/Pokemon',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'BBC News',
    subtitle: 'An unofficial basic implementation of the BBC News app built using React Native.',
    description: 'An unofficial basic implementation of the BBC News app built using React Native.',
    repository_url: 'https://github.com/joeltrew/BBCNews-React-Native',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'FC Barca App',
    subtitle: 'FC Barcelona in React Native.',
    description: 'FC Barcelona in React Native.',
    repository_url: 'https://github.com/VctrySam/FCBarca',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'AirBnb Clone',
    subtitle: 'An Airbnb Clone in React Native.',
    description: 'An Airbnb Clone in React Native.',
    repository_url: 'https://github.com/VctrySam/AirBnb',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Assemblies',
    subtitle: 'A developer-focused Meetup clone built with React Native.',
    description: 'A developer-focused Meetup clone built with React Native.',
    repository_url: 'https://github.com/buildreactnative/assemblies',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: '21mobile',
    subtitle: 'Cinema 21 movie schedule app built with react native, graphql, redux',
    description: 'Cinema 21 movie schedule app built with react native, graphql, redux',
    repository_url: 'https://github.com/sonnylazuardi/21mobile',
    application_url: 'https://21mobile.sonnylab.com',
    user: user,
  )

  Project.create!(
    title: 'Dribbble',
    subtitle: 'Dribbble app built with React Native',
    description: 'Dribbble app built with React Native',
    repository_url: 'https://github.com/catalinmiron/react-native-dribbble-app',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Whatsapp Clone',
    subtitle: 'Whatsapp Clone app built with React Native',
    description: 'Whatsapp Clone app built with React Native',
    repository_url: 'https://github.com/VctrySam/whatsapp',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'London React',
    subtitle: 'React Native app for the London React Meetup',
    description: 'React Native app for the London React Meetup',
    repository_url: 'https://github.com/JoeStanton/london-react',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Snapchat Clone',
    subtitle: 'SnapChat clone written with React Native',
    description: 'SnapChat clone written with React Native',
    repository_url: 'https://github.com/VctrySam/SnapChat',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Civis Face',
    subtitle: 'An app for exploring facial recognition using react-native, AWS Rekognition, and AWS Polly.',
    description: 'An app for exploring facial recognition using react-native, AWS Rekognition, and AWS Polly.',
    repository_url: 'https://github.com/civisanalytics/CivisFace',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Standard Notes',
    subtitle: 'A simple and private notes app',
    description: 'A simple and private notes app',
    repository_url: 'https://github.com/standardnotes/mobile',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Attendant',
    subtitle: 'Laravel Valet GUI - An app to monitor your sites running on Valet. Packaged with Electron',
    description: 'Laravel Valet GUI - An app to monitor your sites running on Valet. Packaged with Electron',
    repository_url: 'https://github.com/phppirate/attendant',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Friendlychat',
    subtitle: 'Firebase codelab for building a cross-platform chat app',
    description: 'Firebase codelab for building a cross-platform chat app',
    repository_url: 'https://github.com/firebase/friendlychat',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Friendlypix',
    subtitle: 'FriendlyPix is a cross-platform Firebase example app',
    description: 'FriendlyPix is a cross-platform Firebase example app',
    repository_url: 'https://github.com/firebase/friendlypix',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Firefeed',
    subtitle: 'Firefeed is a web app that lets users post small messages called sparks to their feed.',
    description: 'Firefeed is a web app that lets users post small messages called sparks to their feed.',
    repository_url: 'https://github.com/firebase/firefeed',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Fun Retro',
    subtitle: 'Fun Retro is a distributed retrospective app that is easy and simple to use.',
    description: 'Fun Retro is a distributed retrospective app that is easy and simple to use.',
    repository_url: 'https://github.com/funretro/distributed',
    application_url: '',
    user: user,
  )

  Project.create!(
    title: 'Crystal ANN',
    subtitle: 'Web site to announce new Crystal projects, blog posts, updates and other work activities',
    description: 'Web site to announce new Crystal projects, blog posts, updates and other work activities',
    repository_url: 'https://github.com/crystal-community/crystal-ann',
    application_url: 'https://crystal-ann.com',
    user: user,
  )

  Project.create!(
    title: 'MySQL Database Library',
    subtitle: 'C# tool for seamless MySQL connection and CRUD operations',
    description: 'C# tool for seamless MySQL connection and CRUD operations',
    repository_url: 'https://github.com/Ezeji/MySQL-Database-Library',
    application_url: 'https://medium.com/@franklinezeji/mysql-database-library-for-c-developers-4bec985dc009',
    user: user,
  )
end
