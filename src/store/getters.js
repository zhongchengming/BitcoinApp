const getters = {
  token: state => state.user.token,
  userId: state => state.user.userId,
  username: state => state.user.username,
  invitationcode: state => state.user.invitationcode,
  integral: state => state.user.integral,
  btbname: state => state.user.btbname,
  btbmoney: state => state.user.btbmoney,
  balance: state => state.user.balance,
  afendtime: state => state.user.afendtime,
  endDay: state => state.user.endDay,
  btbMoneyList: state => state.user.btbMoneyListcommit,
  isbind: state => state.user.isbind
}
export default getters
