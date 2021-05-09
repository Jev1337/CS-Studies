//Random from min to max
function getRndInteger(min, max) {
  return Math.floor(Math.random() * (max - min + 1) ) + min;
}
//Random from min to max-1
function getRndInteger(min, max) {
  return Math.floor(Math.random() * (max - min) ) + min;
}