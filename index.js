const core = require('@actions/core');
const exec = require('@actions/exec').exec;

async function main() {
  try {
    await exec('. ./cheats.sh');
  } catch(err) {
    return core.setFailed(err.message);
  }
  core.info('aws-actions-cheats successfully sourced');
}

main();