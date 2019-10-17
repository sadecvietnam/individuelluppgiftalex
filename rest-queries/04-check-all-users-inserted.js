// Note: Using assert test syntax
module.exports = ({ assert, response, store }) => ({
  path: 'users',
  method: 'get',
  test() {
    // check that we got the right number of users
    assert.equal(response.length, store.mockUsers.length);
    // check that all users where
    // inserted correctly with correct data
    assert.deepEqual(response, store.mockUsers);
  }
});