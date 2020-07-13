const core = require('@actions/core');
const exec = require('@actions/exec').exec;

async function main() {
  try {
    await exec('source ./cheats.sh');
  } catch(err) {
    core.setFailed(err.message);
  }
  core.info('aws-actions-cheats successfully sourced');
}

main();