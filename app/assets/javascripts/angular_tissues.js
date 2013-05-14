var TissuesApp = angular.module('TissuesApp', [])

TissuesApp.controller('TissuesCtrl', ['$scope', function($scope){
    $scope.heading = "hello, world";
    $scope.tissues = [
	{name: "spleen", total: 11},
	{name: "elbow"},
        {name: "heart"}];
    $scope.todos = [
    {text:'learn angular', done:true},
    {text:'build an angular app', done:false},
    {text:'stuff', done: false}];

}])
