// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
    path: 'order_rows',
    method: 'get',
    test() {
      // check that we got the right number of order rows
      assert.equal(response.length, store.mockOrder_rows.length);
      // check that all order_rows where
      // inserted correctly with correct data
      console.log("response orders in DB", response);
      console.log("mockOrder_rows", store.mockOrder_rows);
      assert.deepEqual(response, store.mockOrder_rows);
    }
  });