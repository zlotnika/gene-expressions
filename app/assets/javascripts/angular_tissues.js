var TissuesApp = angular.module('TissuesApp', ['ngResource'])

TissuesApp.controller('TissuesCtrl', ['$scope', function($scope){
    $scope.heading = "hello, world";
    $scope.things = ["hi","hello"];
    $scope.tissues = [
	{name: "spleen", total: 11},
	{name: "elbow"},
        {name: "heart"}];
    $scope.todos = [
    {text:'learn stuff', done:true},
    {text:'build a thing', done:false},
    {text:'stuff', done: false}];
}])
