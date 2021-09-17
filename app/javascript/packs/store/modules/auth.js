import axios from "axios";

const defaultState = () => ({
  userId: null,
  userName: null,
});

export default {
  namespaced: true,
  state: defaultState(),
  getters: {
    userId: (state) => state.userId,
    userName: (state) => state.userName,
  },
  mutations: {
    SET_USER(state, userId, userName) {
      state.userId = userId;
      state.userName = userName;
    },
  },
  actions: {
    async googleLogin({ commit }) {
      try {
        let current_user
        await axios.get("api/auth").then(response => (current_user = response.data));

        const userId = current_user.id
        const userName = current_user.name

        commit('SET_USER', userId, userName)
      }
      catch (err) {
        console.error(err);
      }
    }
  },
};
