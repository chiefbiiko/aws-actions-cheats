const exec = require("child_process").exec;

exec(
  "curl -fSL# https://raw.githubusercontent.com/chiefbiiko/aws-actions-cheats/master/cheats.sh -o /tmp/cheats.sh\n" +
  ". /tmp/cheats.sh\n" +
  "compgen -A function",
  function (err) {
    if (err) {
      console.error(err.message);
      process.exitCode = 1;
    } else {
      console.log("aws-actions-cheats are now available in your sh");  
    }
});
