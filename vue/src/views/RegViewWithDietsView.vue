<!-- <template>
    <div>
      <section class="layout">
        <div class="header">
          <div class="header-content">
            <div class="header-text">
              <h1 class="header-title">Pot·luck</h1>
              <h2 class="header-phonetic">
                <form v-on:submit.prevent="register">
                  <h1>Register User</h1>
                  <div role="alert" v-if="registrationErrors">
                    {{ registrationErrorMsg }}
                  </div>
                  <div class="form-input-group">
                    <input class="input is-rounded" type="text" id="username" placeholder="Username" v-model="user.username"
                      required autofocus />
                  </div>
                  <div class="form-input-group control has-icons-left has-icons-right">
                    <input class="input is-rounded" type="email" placeholder="Email" v-model="user.email" required>
                    <span class="icon is-left">
                      <i class="fas fa-envelope"></i>
                    </span>
                  </div>
                  <div class="form-input-group control has-icons-left">
                    <input class="input is-rounded" type="password" id="password" placeholder="Password"
                      v-model="user.password" required />
                    <span class="icon is-left">
                      <i class="fas fa-lock"></i>
                    </span>
                  </div>
                  <div class="form-input-group control has-icons-left">
                    <input class="input is-rounded" type="password" id="confirmPassword" placeholder="Confirm Password"
                      v-model="user.confirmPassword" required />
                    <span class="icon is-left">
                      <i class="fas fa-lock"></i>
                    </span>
                  </div>
                  <div class="form-input-group">
                    <label for="security-question"></label>
                    <div class="select is-rounded is-full width">
                      <select id="security-question" v-model="user.securityQuestion">
                        <option value="" selected hidden>Select a Security Question</option>
                        <option>What is your mother's maiden name?</option>
                        <option>Where did you go to high school?</option>
                        <option>What is your favorite color?</option>
                        <option>What is your favorite season?</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-input-group">
                    <input class="input is-rounded" type="text" id="security-answer" placeholder="Security Answer"
                      v-model="user.securityAnswer" required />
                  </div>
                  <div class="form-input-group">
                    <div class="toggle-section">
                      <button @click.prevent="toggleSpecialDiets" type="button">{{ showSpecialDiets ? 'Hide Special Diets' :
                        'Special Diets' }}</button>
                      <div v-if="showSpecialDiets" class="checkbox-group">
                        <label v-for="diet in specialDiets" :key="diet">
                          <input type="checkbox" :value="diet" v-model="user.diets" />
                          {{ diet }}
                        </label>
                      </div>
  
                      <button @click.prevent="toggleAllergens" type="button">{{ showAllergens ? 'Hide Allergens' :
                        'Allergens' }}</button>
                      <div v-if="showAllergens" class="checkbox-group">
                        <label v-for="allergen in allergens" :key="allergen">
                          <input type="checkbox" :value="allergen" v-model="user.allergens" />
                          {{ allergen }}
                        </label>
                      </div>
                    </div>
                  </div>
                  <br>
                  <button class="button is-warning" type="submit">Register</button>
                </form>
              </h2>
            </div>
          </div>
        </div>
      </section>
      <div id="register" class="text-center"></div>
    </div>
  </template>
  
  <script>
  import authService from '../services/AuthService';
  
  export default {
    data() {
      return {
        user: {
          username: '',
          email: '',
          password: '',
          confirmPassword: '',
          role: 'user',
          securityQuestion: '',
          securityAnswer: '',
          diets: [],
          allergens: [],
  
        },
        showSpecialDiets: false,
        showAllergens: false,
        specialDiets: ['Vegan', 'Vegetarian', 'Halal', 'Celiac Friendly', 'Dairy-Free', 'Kosher'],
        allergens: ['Fish', 'Shellfish', 'Milk', 'Eggs', 'Soy', 'Sesame', 'Treenuts', 'Peanuts', 'Wheat'],
        registrationErrors: false,
        registrationErrorMsg: 'There were problems registering this user.',
      };
    },
    methods: {
      register() {
        if (this.user.password != this.user.confirmPassword) {
          this.registrationErrors = true;
          this.registrationErrorMsg = 'Password & Confirm Password do not match.';
        } else {
          authService
            .register(this.user)
            .then((response) => {
              if (response.status == 201) {
                this.$router.push({
                  path: '/login',
                  query: { registration: 'success' },
                });
              }
            })
            .catch((error) => {
              const response = error.response;
              this.registrationErrors = true;
              if (response.status === 400) {
                this.registrationErrorMsg = 'Bad Request: Validation Errors';
              }
            });
        }
      },
      clearErrors() {
        this.registrationErrors = false;
        this.registrationErrorMsg = 'There were problems registering this user.';
      },
      toggleSpecialDiets() {
        this.showSpecialDiets = !this.showSpecialDiets;
      },
      toggleAllergens() {
        this.showAllergens = !this.showAllergens;
      },
    },
  };
  </script>
  
  <style></style> -->