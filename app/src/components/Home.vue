<template>

  <div class="hello">
    
    


    <body>

    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Taste Table is the most easiest & decentralized matching solution via blockchain.</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <form>
              <div class="form-row">
               
               
              </div>
              
            </form>
            
          </div>
          
        </div>
         <div>
                  <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
         </div>
      </div>
    </header>
    
    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <img src="/static/img/discount.png">
              </div>
              <h3>1</h3>
              <p class="lead mb-0">You can easy to write your taste table, can be compared with others immediately.
</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-layers m-auto text-primary"></i>
              </div>
              <h3>2y</h3>
              <p class="lead mb-0">The result of matching is basically provided as % form.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-check m-auto text-primary"></i>
              </div>
              <h3>3</h3>
              <p class="lead mb-0">If you want to know the intersections of matching, you can get it with a certain amount of pay.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- Image Showcases -->
    <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row no-gutters">

    
            
      <li v-for="table in tables"  v-bind:key='table.id' class="all_hover_button"
        v-on:click="createTaste(table.text)">
        <tastetable  v-bind:score="table.scores" v-bind:name="table.text">
        </tastetable>
      </li>
    

        </div>
      </div>
    </section>

    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
      <div class="container">
       
      </div>
    </section>

    <!-- Call to Action -->
    <section class="call-to-action text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        
      </div>
    </section>


    </body>
    
    
  </div>
</template>

<script>
// import Vue from 'vue'
import router from '../router'
export default {
  name: 'home',
  components: {
    'tastetable': () => import('./tastetable')
  },
  methods: {
    createTaste (tableId) {
      console.log('tableId')
      router.push({name: 'CreateTaste1', params: { tableId: tableId }})
    }
  },
  data () {
    return {
      tables: [
        {
          'text': 'Travel',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          'text': 'Food',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          'text': 'Dating',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

li.all_hover_button:hover {
    background-color: #aac1ff;
    cursor: pointer;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-weight: 700;
}

body {
    padding: 20px;
    font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}


</style>
