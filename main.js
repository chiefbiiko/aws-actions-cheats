const exec = require("child_process").exec;

const files = [
  "s3_bucket_exists.sh",
  "s3_object_exists.sh",
  "s3_uri.sh",
  "s3_url.sh",
];

const commas = files.join(",");

const chmodx = files.map(function (file) {
  return "chmod +x /usr/local/bin/" + file;
}).join(" && ");

exec(
  "sudo sh -c 'cd /usr/local/bin && " +
  "curl -fSL# --remote-name-all https://raw.githubusercontent.com/chiefbiiko/aws-actions-cheats/master/cheats/{" + commas + "} && " +
  chmodx +
  " && cd $HOME && s3_url -h'",
  function (err) {
    if (err) {
      console.error(err.message);
      process.exitCode = 1;
    } else {
      console.log("aws-actions-cheats are now available in your sh");  
    }
});