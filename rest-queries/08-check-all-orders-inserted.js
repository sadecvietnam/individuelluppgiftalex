// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
    path: 'orders',
    method: 'get',
    test() {
      // check that we got the right number of orders
      assert.equal(response.length, store.mockOrders.length);
      // check that all orders where
      // inserted correctly with correct data
      assert.deepEqual(response, store.mockOrders);
    }
  });