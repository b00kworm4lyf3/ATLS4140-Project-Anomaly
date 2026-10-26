# Design Doc for Project Anomaly (Working Title)

## Summary + Overview (Copy from README) --> TODO REPLACE WITH MORE IN-DEPTH STORYLINE

You are hired to find cursed items in the stored rooms of a museum, they have a large and cluttered inventory and can't put things on view to the public until they're sure the items are safe. Using your specialized tools (*flashlight/blacklight, geiger counter/other sound based device, need one more thing here probably*), find the cursed items that need to be removed from the collection.

While inspecting items, you discover that you can activate the curses on the items you identify for removal, some of them will even help you find other cursed items! But others will harm your hunt, are you brave enough to take the gamble? The items are only usable for a short amount of time, so make your decision quickly. Use the items and lose their cash value or take the cash and lose out on satisfying your curiosity.

We are building this in [Godot 4.7](https://godotengine.org/)

### Final Project Deliverable Goals + Constraints

- 3D survival-horror indie game
- Platform: Itch.io
- Target Player: horror fans, strategists, single-player gamers
- Two rooms with at least two permanent tools and 10 cursed items
- Basic UI with hotlist of collected cursed items
- Ability to inspect items and identify them for removal

## Controls and Core Loop (this or that, player chooses)

- **Move**: WASD/arrow keys or click to move
- **Look**: mouse point or click + drag
- **Inspect**: left mouse click or double click
- **Use Item**: Number keys to select slot, enter to activate or left click to select and double click to activate.
- hover over item in hotlist for 'tooltips'

### Actions

- **Explore Museum**: Walk around rooms, open cupboards, drawers, doors, etc
- **Pick Up Items**: Inspect suspicious/anomalous items and identify if they need to be removed
- **Cash In**: Take items to exit or drop off point if effect isn't used (*is money the score? can they buy things with it?*)
- **Use Items**: Use collected anomalous item curses

### Loop Timeframe --> ***NEEDS MORE BRAINSTORMING***

- *Limited time in museum to retrieve items*
- *or have a certain number of loops through the museum to get the highest score possible or beat a predetermined score*

## Mechanics

- The player can pick up and add items to a limited inventory (***How many spaces?***)
- Storage Behaviour: If inventory is full, current items need to be used + placed back in the room OR cashed in at drop off point
- The items will have a randomized effect, harmful or helpful, that is hidden until player activates it
- Items have monetary value: items have sell value based on item, total added to monetary display on sale of item(s)
  
### Search Tools + Effects

- **Flashlight/Blacklight**: activates glow effect on some cursed items
  - Some items may glow after having a light shine on them for some time and then turned off. Effect dims over time after light is turned off
    - Glow is visual and audible (slight hum)
- **Geiger Counter**: activates audible effect on some cursed items
  - Some items may respond audibly when the geiger counter is held near them
    - 'Sound' is audible (clicking/tinking) as well as visual (flickery/glittery effect)

### Item Effects

#### Positive Effects

- *Give more inventory space*
- *Give a geiger counter to help the player find items*
- *Double total item value*
- *Give a brighter flashlight -> glow items glow longer without flashlight*
- *Give a brighter blacklight -> reactive items glow brighter*

#### Negative Effects

- *Give less inventory space*
- *Halve total item value*
- *Give a dimmer flashlight*
- *Make the player "trip" or freeze for 3 seconds every 60 seconds*
