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
        const { data } = await axios.get("api/auth")

        const userId = data.id
        const userName = data.name

        commit('SET_USER', userId, userName)
      }
      catch (err) {
        console.error(err);
      }
    }
  },
};
