const getters = {
  userId: state => state.user.userId,
  username: state => state.user.username,
  invitationcode: state => state.user.invitationcode,
  integral: state => state.user.integral,
  btbname: state => state.user.btbname,
  btbmoney: state => state.user.btbmoney,
  afendtime: state => state.user.afendtime
}
export default getters
