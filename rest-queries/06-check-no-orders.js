// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
    path: 'orders',
    method: 'get',
    test() {
     // Check that there are no orders in DB
     assert.deepEqual(response, []);
    },
    setup() {
      // Store the mockorders in the db (setup for next step/query)
      store.mockOrders = require('./orders.json');
      // the mockOrders have no user ids, add those from the users
      // we just created
      //console.log("mockOrders without userid", store.mockOrders);
      for(let i = 0; i < store.mockOrders.length; i++){
        store.mockOrders[i].userid = store.mockUsers[i].id;
      }
     //console.log("mockOrders with userids added from users that in the db", store.mockOrders);
    }
  });