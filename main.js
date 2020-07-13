const exec = require("child_process").exec;

const files = [
  "s3_bucket_exists",
  "s3_object_exists",
  "s3_uri",
  "s3_url",
];

const commas = files.join(",");

const chmodx = files.map(function (file) {
  return "chmod +x /usr/local/bin/" + file;
}).join(" && ");

const cmd = "sudo sh -c 'cd /usr/local/bin && " +
  "curl -fSL# --remote-name-all https://raw.githubusercontent.com/chiefbiiko/aws-actions-cheats/master/cheats/{" +
  commas + "} && " +
  chmodx + "'";

exec(cmd, function (err) {
  if (err) {
    console.error(err.message);
    process.exitCode = 1;
  } else {
    console.log("aws-actions-cheats are now available in your sh");
  }
});
