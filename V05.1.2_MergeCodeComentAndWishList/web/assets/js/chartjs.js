!function(r){function o(t){if(a[t])return a[t].exports;var e=a[t]={i:t,l:!1,exports:{}};return r[t].call(e.exports,e,e.exports,o),e.l=!0,e.exports}var a={};o.m=r,o.c=a,o.d=function(r,a,t){o.o(r,a)||Object.defineProperty(r,a,{configurable:!1,enumerable:!0,get:t})},o.n=function(r){var a=r&&r.__esModule?function(){return r.default}:function(){return r};return o.d(a,"a",a),a},o.o=function(r,o){return Object.prototype.hasOwnProperty.call(r,o)},o.p="",o(o.s=16)}({16:function(r,o,a){r.exports=a(17)},17:function(r,o){!function(r){function o(r){var o=/^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(r);return o?{r:parseInt(o[1],16),g:parseInt(o[2],16),b:parseInt(o[3],16)}:null}function a(r,a){return"rgba("+o(r).r+","+o(r).g+","+o(r).b+", "+a+")"}var t={labels:["January","February","March","April","May","June","July"],color:colors["chart-primary"],datasets:[{label:"Label",fill:!0,backgroundColor:a(colors["chart-primary"],.1),borderColor:colors["chart-primary"],borderCapStyle:"butt",borderJoinStyle:"miter",pointBorderWidth:5,pointBorderColor:colors["chart-primary"],pointBackgroundColor:colors["chart-primary"],pointHoverRadius:5,pointHoverBackgroundColor:"#fff",pointHoverBorderWidth:0,data:[10,59,23,81,56,55,40]}]};r("#lineChart").length&&new Chart(r("#lineChart"),{type:"line",data:t,options:{legend:{display:!1},scales:{xAxes:[{display:!1}],yAxes:[{ticks:{fontColor:a(colors["chart-primary"],.84),fontStyle:"500",fontSize:14,beginAtZero:!0},gridLines:{color:a(colors["chart-primary"],.1),zeroLineColor:a(colors["chart-primary"],.2)}}]}}});var e={labels:["A","B","C","D","E","F","G","H","I","J","K"],datasets:[{label:"",backgroundColor:"#ffffff",borderColor:colors["chart-primary"],hoverBackgroundColor:a("#ffffff",.4),data:[65,59,80,81,56,55,40,81,56,55,40]}]};r("#barChart").length&&new Chart(r("#barChart"),{type:"bar",data:e,options:{legend:{display:!1},scales:{xAxes:[{display:!1}],yAxes:[{ticks:{beginAtZero:!0,fontColor:"#ffffff"},gridLines:{color:"rgba(255,255,255, 0.2)",zeroLineColor:"rgba(255, 255, 255, 0.2)"}}]},tooltips:{backgroundColor:"#212121",cornerRadius:3,caretSize:0}}});var l={labels:["Eating","Drinking","Sleeping","Designing","Coding","Cycling","Running"],datasets:[{label:"My First dataset",backgroundColor:a(colors["primary-color"],.2),borderColor:colors["chart-primary"],pointBackgroundColor:colors["chart-primary"],pointBorderColor:"#fff",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(179,181,198,1)",data:[65,59,90,81,56,55,40]}]};r("#radarChart").length&&new Chart(r("#radarChart"),{type:"radar",data:l});var n={datasets:[{data:[11,16,7,14,3],backgroundColor:[colors["chart-primary"],colors["chart-secondary"],colors["chart-third"],colors["purple-500"],colors["grey-500"]],label:"Dataset"}],labels:["Color #1","Color #2","Color #3","Color #4","Color #5"]};r("#polarChart").length&&new Chart(r("#polarChart"),{data:n,type:"polarArea",options:{elements:{arc:{borderColor:"#ffffff"}}}});var c={labels:["Color 1","Color 2","Color 3"],datasets:[{data:[300,50,100],backgroundColor:[colors["chart-primary"],colors["chart-secondary"],colors["chart-third"]],hoverBackgroundColor:[a(colors["chart-primary"],.84),a(colors["chart-secondary"],.84),a(colors["chart-third"],.84)]}]};r("#pieChart").length&&new Chart(r("#pieChart"),{type:"pie",data:c});var i={labels:["Color 1","Color 2","Color 3"],datasets:[{data:[300,50,100],backgroundColor:[colors["chart-primary"],colors["chart-secondary"],colors["chart-third"]],hoverBackgroundColor:[a(colors["chart-primary"],.84),a(colors["chart-secondary"],.84),a(colors["chart-third"],.84)]}]};r("#donutChart").length&&new Chart(r("#donutChart"),{type:"doughnut",data:i})}(jQuery)}});