const core = require('@actions/core');
const exec = require("util").promisify(require("child_process").exec);

async function main() {
  try {
    await exec("source ./cheats.sh");
  } catch (err) {
    core.setFailed(err.message);
  }
}

main();