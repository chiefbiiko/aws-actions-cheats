const exec =  require("child_process").exec;

exec("source ./cheats.sh", { shell: "/bin/bash" }, function (err) {
  if (err) {
    console.error(err.message);
    process.exitCode = 1;
  } else {
    console.log("aws-actions-cheats are now available in your sh");  
  }
});
