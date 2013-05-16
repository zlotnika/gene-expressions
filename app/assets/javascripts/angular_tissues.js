var TissuesApp = angular.module('TissuesApp', ['ngResource'])


TissuesApp.controller('TissuesCtrl', ['$scope', 'Tissue', function($scope, Tissue){
    $scope.real_tissues = Tissue.query();
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
    
    $scope.done_todos = function(){
	done_ones = [];
	angular.forEach($scope.todos, function(todo){
	    if (todo.done){
		done_ones.push(todo);
	    }
	})
	return done_ones;
    }
    $scope.finisheds = $scope.done_todos();
}])

TissuesApp.factory('Tissue', ['$resource', function($resource){
    console.log($resource('/tissues'))
    return $resource('/tissues');
}])

