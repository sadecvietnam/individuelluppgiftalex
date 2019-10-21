// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
    path: 'otherlayouts',
    method: 'get',
    test() {
      // check that we got the right number of order rows
      assert.equal(response.length, store.mockotherlayouts.length);
      // check that all order_rows where
      // inserted correctly with correct data
      console.log("response orders in DB", response);
      console.log("mockotherlayouts", store.otherlayouts);
      assert.deepEqual(response, store.mockotherlayouts);
    },
    setup() {
        // Store the mockotherlayouts in the db (setup for next step/query)
        store.mockotherlayouts = require('./otherlayouts.json');
      }
    });
  