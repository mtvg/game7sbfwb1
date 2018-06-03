var score=[];
[].forEach.call(document.getElementsByClassName("scoring-play"), function(item){
var q=item.parentNode.parentNode.parentNode.id.substr(-1);
var t=item.getElementsByClassName("time-stamp")[0].innerText.split(':')
var t0=t.length>1?parseInt(t[0]):0, t1=t.length>1?parseInt(t[1]):parseFloat(t[0])
var s=item.getElementsByClassName("combined-score")[0].innerText.split(' - ');
score.push([parseInt(q)-1, t0, t1, parseInt(s[0]), parseInt(s[1])]);
})
console.log(JSON.stringify(score));