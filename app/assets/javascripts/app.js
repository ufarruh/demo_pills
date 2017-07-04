var App = angular.module('App', 
  
  [
  'Devise', 
  'ui.router',
  'restangular',
  'ui.bootstrap', 
  'angularUtils.directives.dirPagination', 
  'datatables',
  'datatables.bootstrap',
  'ngAnimate'
  ]);


App.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider){

    $urlRouterProvider.otherwise('/');

    $stateProvider

      .state('home', {
        url: '/',
        views: {
          "@" : {
            templateUrl: "templates/home/home.html"
          },

          "navbar@" : {
            templateUrl: "templates/home/_navbar.html",
            controller: "UsersController"
          },
          
          "footer@" : {
            templateUrl: 'templates/home/_footer.html'
          },
          "searchForm@home" : {
            templateUrl: "templates/home/_searchForm.html",
            controller: "DrugsCtrl"
          },
          "categories@home" : {
            templateUrl: 'templates/home/_categories.html',
            controller: 'CategoriesCtrl'
          }

        }
      })

      .state('home.drugs', {
        url: 'drugs',
        views: {
          '@' : {
            controller: 'DrugsCtrl'
          },
        }
      })

      .state('home.drugs.show', {
        url: '/:id',
        views: {
          '@' : {
            templateUrl: 'templates/drugs/show.html',
            controller: 'DrugsCtrl'
          }
        }
      })

      .state('home.categories', {
        url: 'categories',
        views: {
          "@" : {
            templateUrl: 'templates/categories/_index.html',
            controller: 'CategoriesCtrl'
          }
        }

      })
      .state('home.categories.show', {
        url: '/:id',
        views: {
          "@" : {
            templateUrl: 'templates/categories/_show.html',
            controller: 'CategoriesCtrl'
          }
        }
      })

      .state("home.dashboard", {
        url: "dashboard",
        views: {
          "@" : {
            templateUrl: "templates/pharmacy/_dashboard.html",
            controller: "PharmaciesCtrl"
          }
        }
      })
      .state("home.dashboard.pharm", {
        url: "/pharm",
        views: {
          "pharm@home.dashboard" : {
            templateUrl: "templates/pharmacy/_pharm.html",
            controller: "PharmaciesCtrl"
          }
        }
      })

      .state("home.dashboard.pharmacy", {
        url: "/pharmacy",
        views: {
          "pharm@home.dashboard" : {
            templateUrl: "templates/pharmacy/_pharmacy.html",
            controller: "PharmaciesCtrl"
          }
        }
      })

      .state("home.new", {
        url: "pharmacy/new",
        views: {
          "@" : {
            templateUrl: "templates/pharmacy/_newPharmacyForm.html",
            controller: "PharmaciesCtrl"
          }
        }
      })

      .state("home.new.info", {
        url: "/info",
        templateUrl: "templates/pharmacy/partials/_info.html"
      })

      .state("home.new.success", {
        url: "/success",
        templateUrl: "templates/pharmacy/partials/_success.html"
      })


      .state("home.dashboard.drugs", {
        url: "/drugs",
        views: {
          "pharm@home.dashboard" : {
            templateUrl: "templates/pharmacy/_drugs.html",
            controller: "DrugsCtrl"
          }
        }
      })

      .state("home.profile", {
        url: "profile",
        views: {
          "@" : {
            templateUrl: "templates/profile/_user.html",
            controller: "UsersController"
          },
          "registerView@home.profile" : {
            templateUrl: "templates/auth/_register.html",
            controller: "UsersController"
          },
          "signInView@home.profile" : {
            templateUrl: "templates/auth/_signIn.html",
            controller: "UsersController"
          }
        }
      })

      .state("home.profile.favorites", {
        url: "/favorites",
        views: {
          "@" : {
            templateUrl: "templates/profile/_favorites.html",
            controller: "UsersController"
          }
        }
      })

      .state("home.mobileSearch", {
        url: "search",
        views: {
          "mobileView@" : {
            templateUrl: "templates/search/_mobileSearch.html",
            controller: "DrugsCtrl"
          }
        }
      });


}]);


App.config( ['RestangularProvider', function(RestangularProvider) {

    RestangularProvider.setBaseUrl('/api/v1');
    RestangularProvider.setRequestSuffix('.json');
    RestangularProvider.setDefaultHttpFields({
        "content-type": "application/json"
    });

}]);

App.run(['$rootScope', function($rootScope){
  $rootScope.$on("$stateChangeError", console.log.bind(console));
}]);


App.config(
  ["$httpProvider",
  function($httpProvider) {
    var token = $('meta[name=csrf-token]')
      .attr('content');
    $httpProvider
      .defaults
      .headers
      .common['X-CSRF-Token'] = token;
}]);




