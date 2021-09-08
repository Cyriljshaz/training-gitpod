const assert = require('assert');
const { deploy, setQuiet } = require('@completium/completium-cli');

setQuiet(true);

let add_number;

describe("Test add_number", async () => {
  it("Deploy contract", async () => {
    [add_number, _] = await deploy('add_number.arl');
  });
  it("Call 'increment' entry", async () => {
    await add_number.increment({ arg : { quantity : 2 }});
  });
  it("Check storage value", async () => {
    const storage = await add_number.getStorage();
    const count = storage.toNumber();
    assert(count == 4, "Invalid counter value");
  });
});
