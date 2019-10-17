// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
    path: 'order_rows',
    method: 'get',
    test() {
     // Check that there are no orders in DB
     assert.deepEqual(response, []);
    },
    setup() {
        console.log("BEFORE")
      // Store the mockorders in the db (setup for next step/query)
      store.mockOrder_rows = require('./order_rows.json');
      // the mockOrders have no user ids, add those from the users
      // we just created
      console.log("mockOrder_rows without userid", store.mockOrders);
      for(let i = 0; i < store.mockOrder_rows.length; i++){
        store.mockOrder_rows[i].orderid = store.mockOrders[i].id;
      }
     console.log("mockOrder_rows with orderids added from orders that are in the db", store.mockOrder_rows);
    }
  });