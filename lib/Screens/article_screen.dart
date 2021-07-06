import '../Providers/articles_data.dart';

import '../Widgets/articles.dart';

import '../Widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  static const routeName = '/Articles';
  final List<ArticlesData> articles = [
    ArticlesData(
      articleId: 'Healthy Diet',
      articleTitle: "1. WAYS TO MAKE YOUR DIET HEALTHIER",
      imageUrl:
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator.com/news/food-safety-quality/covid-19-and-food-this-virus-is-sensitive-to-cooking-temperatures/10810118-1-eng-GB/COVID-19-and-food-This-virus-is-sensitive-to-cooking-temperatures.jpg',
      articleData: ("""
  1. SWITCHING UP YOUR PROTEIN: 
Adding fish into your meals can be a great source of omega 3 and less saturated fats, if you’re a vegetarian you can add flax seeds and chia seeds in your diet which is a substitute for omega 3. Eat enough dairy foods, like, low-fat milk, cheese, yogurts. Dairy foods are rich in three of the four nutrient- potassium, calcium and vitamin D. Don’t forget the protein contribution too, like, eggs, beans, lentils, nuts, soy, quinoa and other grains, these foods can boost fiber and key nutrients like magnesium and vitamin E. 
2. AIM FOR VARIETY:
A simple way to start may be with your choice of fruits, as they require less preparation. Different types of fruits offer a mix of vitamins, minerals and phytonutrients. Try and make all your fruit choices whole fruit instead of juice to maximize fiber. Try and eat every seasonal fruit. Keep frozen, canned or dried fruits on hand when fresh fruits aren’t in season. Don’t discount the run of mill fruit staples. For-ex: while citrus fruits like oranges, grapefruit, lemons and limes may not seem exotic they are packed with health-boosting bioactive ingredients including essential-oils, alkaloids, flavonoids, limonoids, coumarins, carotenoids and phenolic acids, these are a great immunity booster and should be consumed especially during this pandemic.
3. MAKE TIME FOR BREAKFAST: More recently, intermittent fasting has become all the rage, but aside from this strategy, for most people, breakfast is still incredibly important. According to research a regular meal is positive nutrition, linked to better overall health, better diet quality, a healthier body weight and more. If you find yourself snacking too much at night, the first improvement may be to start eating breakfast. Is breakfast the most important meal of the day? Not necessarily- it’s hard to say that one meal is more important than the other- but breakfast can provide fuel, fluids and focus.
4. LIMIT THE EXTRAS: Life is meant to be enjoyed. Every once in a while, Life is meant to be enjoyed. Every once in a while, it’s OK to indulge your sweet tooth. But the key is moderation. There’s room in most diets for a small amount of sugar and saturated fat, bacon added to a sandwich or salad, a cookie or sugar in breakfast cereal. Foods’s high in sugar and saturated fat can taste good but too much of a good thing is linked with health risks. To keep these ‘extras’ to a minimum (less than 10% of calories), make tradeoffs. Skip the butter and sour cream on a baked potato to enjoy a small dish of ice cream. Top pancakes with sliced peaches instead of syrup to save for sugar in hot tea. Make pizza with reduced-fat mozzarella cheese to save fat for a cookie later.
  """),
    ),
    ArticlesData(
      articleId: 'Fight Covid',
      articleTitle: "2.	WAYS TO IMPROVE YOUR IMMUNITY TO HELP FIGHT COVID:",
      imageUrl:
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator.com/news/food-safety-quality/covid-19-and-food-this-virus-is-sensitive-to-cooking-temperatures/10810118-1-eng-GB/COVID-19-and-food-This-virus-is-sensitive-to-cooking-temperatures.jpg',
      articleData: ("""
1. HOW IMPORTANT IS IMMUNITY DURING THE COVID-19: 
Staying healthy and doing everything in your power to remain that way during the COVID-19 pandemic is of utmost importance. If you feel that you cannot meet your nutrient needs through the foods you are eating, consider adding a multivitamin. Consult with your doctor or a registered dietitian if you feel you would like to add a vitamin or supplement. Remember that all of these healthy behaviors will not make a difference if you do not reduce the risk of contracting the virus by staying inside and avoiding close contact with others.

2. MAINTAIN A REGULAR SLEEP CYCLE:
We’ve heard this a lot of times, but nailing our sleep routine is the most important part of maintaining a strong immune system. Experts say that adults should get at least seven hours of sleep every night to allow the body to feel well-rested and productive the next day. Meanwhile, those who get less than six hours of sleep are likely to catch a cold when exposed to a virus and at risk of developing chronic illnesses such as heart disease.
But aside from getting the recommended number of sleep hours, sleep quality also counts in achieving healthy sleep. A sleep-deprived person has more chances of weakened immunity, which means the body’s immune defenses are weak enough to fight the invading viruses and bacteria, such as flu and the common cold. By allowing our bodies to rejuvenate, we are building our physical defenses to fight off infection.
Everything we do when we’re awake, from walking, working, exercising, and eating pushes our bodies to release inflammatory cells. This type of inflammatory response occurs to repair damaged tissues and the spread of infection. By the time we sleep, the body takes a break from performing this function to prepare itself the next day to do it all over again.
So the next time you’re planning to pull an all-nighter, just think about how you’re risking yourself to COVID-19 by foregoing a good night’s sleep.

3. OBSERVE REGULAR NOURISHMENT:
A regular sleep habit won’t be complete without a balanced diet. Our stomach and immune system are symbiotically connected. To become an effective fighting force against harmful invaders, our immune system needs regular nourishment to beat infection faster. This means you need to include food that supports the immune system.
Here are some immunity boosting foods:
Vitamins and minerals necessary to boost immunity include A, C, E, D, proteins, probiotics and zinc. The best way to fulfill all your nutrient needs is to include all of the food groups and a wide variety of colorful produce in your regular diet. Think of the rainbow when planning meals and strive to hit all of the colors. Each color of a fruit or vegetable indicates a specific vitamin, mineral, antioxidant, and phytonutrient.
 A phytonutrient or phytochemical is a natural, active substance found in plants that provides protection from sun damage, pests, fungi, and germs. These plant-based compounds are believed to be protective against a variety of diseases. 
Beta-carotene is the red-orange color found in carrots, red peppers, sweet potatoes, tomatoes, and green veggies such as broccoli and spinach. Beta-carotene is the nutrient that is converted to vitamin A in the body after you consume it. Vitamin A is also found in some enriched cereals.
Good sources of zinc are lean beef and poultry, eggs, and seafood. Zinc has a higher absorption rate from meat sources, but it can still be obtained from plant sources such as tofu, beans, whole grains, wheat germ, seeds, and nuts. Probiotics are found in fermented foods such as kimchi and well-known cultured dairy products such as yogurt and kefir.

4.STAY FIT:
Exercising gives our immune and metabolic systems a massive boost in plenty of ways. As we exercise, our bodies develop more antibodies and T cells, an important part of the white blood cells that play a major role in immunity by focusing on foreign particles in our bodies. It also eliminates toxins from the body, which energizes the metabolism and cells.
But pushing ourselves to work out obsessively affects our immunity. So if you’ve been exercising intensely on a consistent basis, you may want to tone it down to allow your immune system to catch up. Do this by simply going for a run or taking a walk outdoors or in your garden. You can also watch workout videos online.
Apart from the healthy lifestyle habits we mentioned above, it is important to stay consistent when following health practices to beat COVID-19. This way, it will help you become better prepared both mentally and physically for any challenge to come. But don’t push yourself too much when following these habits. Remember, your body is your best defense against a weak immune system.
"""),
    ),
    ArticlesData(
      articleId: 'Diet Combos',
      articleTitle: "3. DANGEROUS DUOS: 5 SUPPLEMENT COMBOS TO AVOID.",
      imageUrl:
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator.com/news/food-safety-quality/covid-19-and-food-this-virus-is-sensitive-to-cooking-temperatures/10810118-1-eng-GB/COVID-19-and-food-This-virus-is-sensitive-to-cooking-temperatures.jpg',
      articleData: ("""
Let’s face it: Many of us don’t follow the best diets. As a result, our bodies may be lacking in certain essential vitamins and minerals.  What do we do when we have one or more nutritional deficiencies? We either tweak our food choices or take supplements to fill these gaps. If you have more than one nutritional deficiency—or are already taking supplements to support another key area of health—can you save yourself some time by taking your meds all at once? 

You can—but it’s probably not a good idea. For some supplements, optimal absorption can depend on the time of day taken. Not only that—taking certain vitamins, minerals, or other supplements together can also reduce absorption and may result in adverse interactions, which can be harmful to your health. Let’s take a look at five supplement combos you should avoid.

1. MULTIVITAMINS

But, before we get to that, we need to address the elephant in the room: multivitamins. If certain nutrients can adversely interact with one another, then how or why are multivitamins even on the market? The answer isn’t so cut and dried. Most multivitamins are formulated in such a way to counteract any potential negative nutrient-nutrient interactions. They contain the appropriate levels of both synergistic and antagonistic nutrients, meaning that some vitamins and minerals can enhance or inhibit others. 

For example, researchers have shown that magnesium can improve vitamin D levels. On the other hand, vitamin A can decrease vitamin D uptake. That’s why you’ll almost always find that the percentage daily value (% DV) of vitamin D is higher than vitamin A on most multivitamin nutrition labels.  

The downside to this is that you could be getting too much or too little of a certain vitamin or mineral. If you’re deficient in vitamin A, for instance, taking a multivitamin might not fill your nutritional gap. On the flip side, excess levels of fat-soluble vitamins A, D, E, and K—obtained from food and/or supplements—can build up in your body and become toxic, causing serious health problems. Another drawback to multivitamins? Two important nutrients are generally either not included or included in very little amounts (≤ 250 mg): calcium and magnesium. They are considered macronutrients because we need to obtain them in large quantities. The daily requirements of calcium for men and women aged 51-70 years are 1,000 mg and 1,200 mg, respectively. For men and women of the same age group, the daily requirements for magnesium are 420 mg and 320 mg, respectively. (Compare these recommended intake values with those of the micronutrient selenium, which is 55 mcg for both men and women aged ≥ 51 years.) 

So why are calcium and magnesium excluded or, at the very least, included in negligible amounts? Broadly speaking, large doses of some minerals (including calcium and magnesium) will compete with other minerals for absorption in the body.  

For these reasons, single vitamin or mineral supplements tailored to support individual health goals or to address nutrient deficiencies may be preferred over multivitamins. But, for the same reasons mentioned above, here are a few supplement combos you should steer clear of, making sure to take them individually at least a couple hours apart:

2. CALCIUM AND MAGNESIUM

Calcium and magnesium work hand-in-hand to support bone health and other bodily functions. Magnesium is needed for calcium absorption. Because magnesium suppresses parathyroid hormone and stimulates calcitonin, it helps deposit calcium into our bones, preventing osteoporosis. Without magnesium, calcium would become toxic, depositing itself in soft tissue, which can lead to arthritis. So, you’d think that these two minerals should be taken together, right? As discussed earlier, however, taking large amounts of minerals with other minerals will reduce absorption. To maximize your calcium and magnesium supplement benefits, aim to take them at least 2 hours apart. 

3. COPPER AND ZINC

Both copper and zinc are imperative for optimal immune health, including internal and external healing. They work closely together to improve wound elasticity and resistance. But, zinc can interfere with copper absorption. Furthermore, high supplemental doses of zinc (≥ 50 mg/d) over the long term can cause copper deficiency. Although uncommon, copper deficiency can lead to anemia, hypopigmentation, hypercholesterolemia, connective tissue disorders, osteoporosis and other bone defects, abnormal lipid metabolism, ataxia, and higher risk of infection. 

4. FISH OIL AND GINKGO BILOBA

Omega-3 fish oil supplements don’t just offer heart-health benefits—they can also help with body weight and fat reduction, vision loss, and neurocognitive injury. Ginkgo biloba supplements, on the other hand, have been used for the treatment of cognitive impairment (though evidence on the efficacy of such has been mixed). What do these two supplements have in common? They both possess blood-thinning potential. Thus, taking them together can reduce or prevent blood clotting and potentially increase the risk of uncontrolled bleeding. 

5. IRON AND GREEN TEA

Iron is another key player when it comes to immune health. This element facilitates oxygen transport, hemoglobin formation, the breakdown of free radicals, and mitochondrial respiration among other processes. If you mix it with certain beverages, however, your body won’t absorb the mineral. While a glass of orange juice can help boost iron’s absorption, thanks to vitamin C, a glass of milk can have the opposite effect due to calcium’s interference. 
Another antagonist? Green tea. Although the beverage may have many wonderful health benefits, enhancing iron’s bioavailability is not one of them. Researchers have shown that green tea can lead to iron deficiency anemia when consumed in large quantities. Likewise, iron has a negative impact on green tea’s efficacy. In a study led by Penn State researchers, drinking green tea after an iron-rich meal was shown to reduce green tea’s health benefits.
  
  """),
    ),
    ArticlesData(
      articleId: 'Mental Health',
      articleTitle:
          "4.	WAYS TO KEEP YOUR MENTAL HEALTH IN CHECK DURING PANDEMIC:",
      imageUrl:
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator.com/news/food-safety-quality/covid-19-and-food-this-virus-is-sensitive-to-cooking-temperatures/10810118-1-eng-GB/COVID-19-and-food-This-virus-is-sensitive-to-cooking-temperatures.jpg',
      articleData: ("""
    
With many citizens of the world under lockdown, we are constantly in front of a screen. Our constant go to activity is social media or watching the news. This is playing a key factor in destroying our mental health. Even before this pandemic, scientists believed social media caused loneliness and depression. 
A study published in Journal of Social and Clinical Psychology reported that there is a link between using social media and depression. With so much constant negative news, it is easy to fall into a pit of despair.
If being disconnected from your friends, hobbies and normal life has you frustrated, agitated or just feeling down then know you are not alone. This is a completely reasonable response to a rise in misery and isolation.
People suffering from anxiety and depression are more vulnerable in this lockdown. WHO estimates that more than 240 million people around the world suffer from depression. 
HOW TO IMPROVE YOUR MENTAL HEALTH IN LOCKDOWN
Your feelings, emotions and moods are a mixture of chemicals inside your head. When there is an imbalance of said chemicals, we suffer from things like depression, anxiety, and paranoia. Chemicals in our brain are released due to our surroundings, our mindset and our interactions.
It is imperative that we learn how to control what goes on in our head. This guide helps you get started.
There are 2 ways to improve your mental health during this time. The first step is to cut out a lot of negative triggers that are responsible for negative mental health. The second step is to bring in habits that not only boost your mental health, but improve the quality of your life.
WHAT NEEDS TO BE CUTOUT
1. Take a break from social media and news
Constantly thinking about the end of the world, a deadly virus, and then watching news or reading updates creates a dastardly vicious cycle in our heads. We keep thinking about an impending doom that changes the way we think. We start to focus on the negatives, our brain selectively perceives information to bolster this negative narrative.
2. Trust reliable sources of information
Did you hear about how in Africa people started believing that Covid-19 could be spread through mosquitoes? Or how 5G has caused the spread of Coronavirus? Fake news is at its peak around the world. People have been spreading conspiracies theories to fake DIY treatments. It is impossible to stop the spread of fake news because users are used to sharing information without verifying it first.
The National Alliance on Mental Illness advises the general public to consume relevant information that you need to know only. We do not need to know every single update around the world, because that information adds no value to our lives. It feeds a sense of impending doom and paranoia inside of us. Fake information can also be very deadly. In fact, a man in Arizona passed away after self-medicating chloroquine after news stated it was a cure for Coronavirus.
WHO has added a myth buster section to their website to fight against fake news, always get your news from reliable and trusted sources and do not believe anything until you can verify it yourself, this is the only way to save yourself from fake news.
3. Yoga is a game changer
Yoga has a plethora of mental health benefits. The American Psychological Association considers it a useful tool for psychotherapy. Yoga helps with relieving stress, muscle tension and inflammation. It also helps increase your concentration and relaxes your central nervous system.
Doing yoga on a daily basis increases GABA, a natural chemical in the brain responsible for regulating nerve activity. This is especially important for those who suffer from anxiety which causes them to have lower levels of Gaba. Yoga is one of your greatest tools to fight depression and a negative mindset, helping you best in this daunting lockdown.
4. Meditating is key to a peaceful mind 
While yoga consists of simple to complicated body movements, meditation is a much simpler mental exercise to do. Meditation is a process of controlling your thoughts and focusing your mind on a specific thought for a period of time. While it may sound east to do, 10 seconds in to your meditation and you are already in an embarrassing flash back from high school. Hence, meditation requires focus and dedication.
Meditation is not just letting your mind think freely of whatever it wants, it is to tame the horse that runs wild. Numerous studies have shown that meditation decrease stress and helps control anxiety. Also, it enhances self-awareness, increases your attention span and helps with regulating your emotions.
5. Create a routine
A routine gives your life order and where there is order, chaos cannot prevail. Dr. Mimi Winsberg, chief medical officer of Brightside, says “Emulate your life before COVID-19 to the best of your ability—follow the same schedule of when you wake up, when you eat and when you go to sleep”. Create an action plan or a routine, this will help keep your mind at ease.
A study published in The Lancet Psychiatry remarked that people who have a daytime routine have healthier sleeping cycles which contributes to better mental health. A routine can also help you dedicate much needed time to all of the activities we have talked about so far. Rather than just sulking and waiting for this lockdown to end, we can utilize all of this free time to train our brain. This investment will pay off your entire life.
With a proper routine think about all of the things you can learn: self-control, increase in attention span, self-awareness, emotional maturity, and so much more.
6. Learn something online
Educating yourself actually makes you live longer, wait, what? A paper published by the National Bureau of Economic Research stated just this.
The results from the study shows that 25-years-olds with a bit of college education had an average life expectancy of 54.4 years old. Consequently, 25-year-olds with just a high school diploma had an average life expectancy of 51.6 years old. Education also improves our cognition which researchers say plays a key role in Alzheimer’s and memory loss as we age.
Many social scientists also agree, they think that education is an important factor to ensure longer lives. Learning has become so much easier than just a decade ago. With the rise of online courses and tutorials on YouTube you can practically learn any skill with just a bit of dedication and commitment.
7. Interact with your family at home
If you’re working a 9 to 5, you must have thought about taking time off every other weekend but work would never let you. Consider this, regardless of how down, demotivated or average you think of yourself, someone needs you. That someone could be a father, a mother, a sister or a brother. Many of our psychological problems stem from trauma that is usually created during our childhood. 
Taking this time to mend bonds with you family can help dissipate years of underlying stress necessary for a healthy mindset. Children require attention from parents for grooming, emotional growth and their own development; parents are too busy playing the provider role and ignore the nurturing role they should be playing with their children.  
Being stuck under one roof is a blessing, it is the perfect opportunity to get on the right page with the right people. This will help you improve your mental health drastically.
 
  """),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Articles'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBg.jpg'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 2),
            itemBuilder: (context, i) => ArticlesAll(
                articles[i].articleId,
                articles[i].articleData,
                articles[i].articleTitle,
                articles[i].imageUrl),
            itemCount: articles.length,
            padding: EdgeInsets.all(2)),
      ),
      drawer: AppDrawer(),
    );
  }
}
