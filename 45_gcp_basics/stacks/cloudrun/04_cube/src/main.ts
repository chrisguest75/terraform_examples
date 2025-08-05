import P5 from "p5";
import * as d3 from 'd3';

const CREATE_MODE = false;

const twisterBufferHeight = 360 / 4;

type State = {
  xInc1: number;
  xInc2: number;
  xTwist1: number; 
  xTwist2: number; 
  yTwist: number;
  xRock: number;
  xRockInc1: number;
  xRockInc2: number;
  frameCount: number;
  screenCanvas?: HTMLCanvasElement;
  buffer?: P5.Graphics;
  saved?: boolean;
};

const state: State = {
  xInc1: 1.105,
  xInc2: 2.1043,
  xTwist1: 3,
  xTwist2: 10,
  yTwist: 0, 
  xRock: 0,
  xRockInc1: 0.03,
  xRockInc2: 0.0005,
  frameCount: 0,
  screenCanvas: undefined,
  buffer: undefined,
  saved: false,
};

export type Mode = {
  name: string
  draw: (p5:P5) => void
  default?: boolean
}

export function createTwister(p5: P5) {
  p5.background(0);

  p5.ambientLight(20);
  p5.pointLight(
    255, 0, 0, // color
    40, -80, 40 // position
  );
  p5.directionalLight(
    128,160,128, // color
    1, 1, 1  // direction
  );
  p5.shininess(5);
  p5.specularMaterial(40, 120, 255);  
  p5.stroke(0);
  p5.strokeWeight(3);
  p5.rotateY(((Math.PI * 2) / 360) * state.frameCount);
  p5.box(400);

  const line = state.frameCount % twisterBufferHeight;
  if (state.screenCanvas) {
    state.buffer?.copy(
      // source
      state.screenCanvas,
      // source x, y, w, h
      0, p5.windowHeight / 2, p5.windowWidth, 1,
      // destination x, y, w, h
      0, line, state.buffer.width, 1)
  }
}

export function drawTwister(p5: P5) {
  p5.background(0);  
  let xRockAngle = state.xRock
  state.xRock += Math.cos(state.xRockInc1) 
  let xRockInc = state.xRockInc1;

  //state.xTwist1 += state.xInc1;
  let xTwistAngle1 = state.xTwist1
  let xTwistAngle2 = state.xTwist2
  state.yTwist += Math.cos(xTwistAngle1) + Math.sin(xTwistAngle2)

  let twistY = state.yTwist;
  for(let y = 0; y < p5.windowHeight; y++) {
    let line = twistY % (state.buffer.height - 1);
    if (line < 0) {
      line = (state.buffer.height - 1) + line;
    }
    //p5.copy(state.buffer, 0, line, state.buffer.width, 1, 0  - (p5.windowWidth / 2), y  - (p5.windowHeight / 2), state.buffer.width, 1);
    p5.copy(state.buffer, 0, line, state.buffer.width, 1, ((p5.windowWidth / 2) - (state.buffer.width / 2)) + Math.sin((Math.PI * 2) / 100 * xRockAngle) * 100, y, state.buffer.width, 1);
   
    twistY += Math.abs(Math.cos(xTwistAngle1 + xTwistAngle2));
    xTwistAngle1 += state.xInc1; 
    xTwistAngle2 += state.xInc2;
    xRockAngle += state.xRockInc2 * xRockInc; 
    xRockInc += 0.23;
  }
}

export function saveSourceBuffer(p5: P5) {
  if (state.saved) {
    return;
  }
  p5.save(state.buffer, "twister", 'png');
  state.saved = true;
}

export const modes: Mode[] = [
  {
    name: 'Create',
    draw: createTwister,
  },
  {
    name: 'Twist',
    draw: drawTwister,
    default: true
  },
  {
    name: 'Save Source Buffer',
    draw: saveSourceBuffer,
  },  
]

const sketch = (p5: P5) => {
  p5.setup = () => {

      if (CREATE_MODE) {
        const canvas = p5.createCanvas(p5.windowWidth, p5.windowHeight, p5.WEBGL);
        canvas.parent("background")
        state.screenCanvas = canvas;
        state.buffer = p5.createGraphics(600, twisterBufferHeight);
      } else {
        const canvas = p5.createCanvas(p5.windowWidth, p5.windowHeight);
        canvas.parent("background")
        state.screenCanvas = canvas;
        state.buffer = p5.loadImage('public/twister.png');
      }
      const dropdown = d3.select('#mode')
      modes.map((background) => {
        dropdown.append('option').attr('value', background.name).text(background.name);
        if (background.default) {
          dropdown.node().value = background.name;
        }
      });
      p5.background(255);
    };

  p5.draw = () => {
    const selection = d3.select('#mode').node().value;
    const mode = modes.find((background) => background.name === selection);
    if (mode) {
      mode?.draw(p5);
    } else {
      modes.find((mode) => mode.default)?.draw(p5);
    }

    state.frameCount++;
  };


  p5.windowResized = () => {
    p5.resizeCanvas(p5.windowWidth, p5.windowHeight);
    p5.background(255);
  }
};

let _instance = new P5(sketch);
