// Note: Using should test syntax
module.exports = ({ response, store, repeat, i }) => ({
    path: 'order_rows',
    method: 'post',
    body: store.mockOrder_rows[i],
    test() {
      // check that a row was inserted in the db
      response.affectedRows.should.equal(1);
      // store the inserted id in mockUsers
      store.mockOrder_rows[i].id = response.insertId;
      // repeat this step/query as long as
      // there a more mockUsers to insert
      if(store.mockOrder_rows[i + 1]){
        repeat();
      }
    }
  });