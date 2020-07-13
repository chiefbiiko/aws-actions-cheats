const exec = require("child_process").exec;

const files = [
  "s3_bucket_exists",
  "s3_object_exists",
  "s3_uri",
  "s3_url",
];

const cmd = "sudo sh -c 'cd /usr/local/bin && " +
  "curl -fSL# --remote-name-all https://raw.githubusercontent.com/chiefbiiko/aws-actions-cheats/master/cheats/{" +
  files.join(",") + "}" + "'";

exec(cmd, function (err, stdout, stderr) {
  console.log("$$$ err", err);
  console.log("$$$ stdout", stdout);
  console.log("$$$ stderr", stderr);

  if (err || stderr) {
    console.error((err && err.message) || stderr);
    process.exitCode = 1;
  } else {
    console.log(stdout + "\naws-actions-cheats are now available in your sh");
  }
});
