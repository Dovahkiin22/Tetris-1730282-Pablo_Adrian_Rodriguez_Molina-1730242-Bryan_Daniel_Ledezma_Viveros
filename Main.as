package {
	//Librerias
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.*;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import flash.media.SoundChannel;
	public class Main extends MovieClip {
		public var dificult: int = 1;//Variable de dificultad del juego
		var Nfigura: figuraI;
		public var c1: Sound = new Sound(new URLRequest("cancion1.mp3")); //Variable para saber donde se encuentra la canción 1
		public var c2: Sound = new Sound(new URLRequest("cancionjuego.mp3")); //Variable para saber donde se encuentra la canción 2
		public var s1: Sound = new Sound(new URLRequest("select.mp3"));//Variable para saber donde se encuentra sonido de selector
		public var s2: Sound = new Sound(new URLRequest("limit.mp3"));//Variable para saber donde se encuentra sonido cuando llegas al limete
		public function registro() {//Función del registro
			num.text = "1";//Se muestra el uno como primera dificultad
			function siguiente(event: MouseEvent) {//Función para aumentar de dificultad
				if (dificult == 10) {//Si quieres aumentar más de 10 se reproduce un sonido diferente
					s2.play();
				} else {
					s1.play();//Se reproduce un sonido para saber que aumento
					dificult++;//Aumento de dificultad
					num.text = dificult + "";//Se muestra la nueva dificultad
				}
			}
			adelante.addEventListener(MouseEvent.CLICK, siguiente);//Función para disminuir de dificultad
			function atras1(event: MouseEvent) {
				if (dificult == 1) {//Si quieres disminuir menos de 1 se reproduce un sonido diferente
					s2.play();
				} else {
					s1.play();//Se reproduce un sonido para saber que disminuyo
					dificult--;//DIsminución de dificultad
					num.text = dificult + "";//Se muestra la nueva dificultad
				}
			}
			atras.addEventListener(MouseEvent.CLICK, atras1);
		}
		public function juego() { //Función del juego
			c2.play();
			l.visible = false;
			L.visible = false;
			S.visible = false;
			s.visible = false;
			O.visible = false;
			T.visible = false;
			I.visible = false;
			var r: int = Math.random() * 6;
			var mseg: int = 0; //Variable de milisegundos
			var seg: int = 0; //Variable de segundos
			var min: int = 0; //Variable de minutos
			var timer: Timer = new Timer(1);
			//Arrancar tiempo
			timer.start(); //Empieza el timer
			timer.addEventListener(TimerEvent.TIMER, tiempo); //Manda a llamar al timer
			function tiempo(timepoj: TimerEvent): void { //Función para el tiempo que durara jugando
				mseg++; //Aumento de los microsegundos
				time.text = min + "´´" + seg + "´´" + mseg; //Se muestra el tiempo
				if (mseg == 99) { //Si los milisegundos llegan a 99 aumenta en 1 los segundos
					if (r == 0) {
						L.visible = false;
						S.visible = false;
						s.visible = false;
						O.visible = false;
						T.visible = false;
						I.visible = false;
						l.visible = true;
					} else
					if (r == 1) {
						l.visible = false;
						S.visible = false;
						s.visible = false;
						O.visible = false;
						T.visible = false;
						I.visible = false;
						L.visible = true;
					} else
					if (r == 2) {
						l.visible = false;
						L.visible = false;
						s.visible = false;
						O.visible = false;
						T.visible = false;
						I.visible = false;
						S.visible = true;
					} else
					if (r == 3) {
						l.visible = false;
						L.visible = false;
						S.visible = false;
						O.visible = false;
						T.visible = false;
						I.visible = false;
						s.visible = true;
					} else
					if (r == 4) {
						l.visible = false;
						L.visible = false;
						S.visible = false;
						s.visible = false;
						T.visible = false;
						I.visible = false;
						O.visible = true;
					} else
					if (r == 5) {
						l.visible = false;
						L.visible = false;
						S.visible = false;
						s.visible = false;
						O.visible = false;
						I.visible = false;
						T.visible = true;
					} else
					if (r == 6) {
						l.visible = false;
						L.visible = false;
						S.visible = false;
						s.visible = false;
						O.visible = false;
						T.visible = false;
						I.visible = true;
					}
					r = Math.random() * 6;
					seg = seg + 1; //Aumenta en 1 los segundos
					mseg = 0; //Vuelve a 0 los milisegundos
				}
				if (seg == 60) { //Si los segundos llegan a 60 aumenta en 1 los minutos
					min = min + 1; //Aumenta en 1 los minutos
					seg = 0; //Vuelve a 0 los segundos
				}
			}

			var figuras: Number = Math.random() * 400;
			var speed1: Number = 8;
			Nfigura = new figuraI();
			addChild(Nfigura);
			function abajo(event: Event): void {
				Nfigura.x = 174.7;
				Nfigura.y += 5;
			}
			addEventListener(Event.ENTER_FRAME, abajo);
			rojo.visible = false;
			amarillo.visible = false;
			rosa.visible = false;
			gris.visible = false;
			celeste.visible = false;
			azul.visible = false;
			verde.visible = false;
			var fig: int = Math.random() * 6;
			function mostrarfig(event: Event): void {
				if (fig == 0) {
					if (rojo != true) {
						rojo.visible = true;
						rojo.x = 174.7;
						rojo.y = 37.5;
					}
				} else
				if (fig == 1) {
					if (amarillo != true) {
						amarillo.visible = true;
						amarillo.x = 174.7;
						amarillo.y = 37.5;
					}
				} else
				if (fig == 2) {
					if (rosa != true) {
						rosa.visible = true;
						rosa.x = 149.7;
						rosa.y = 37.5;
					}
				} else
				if (fig == 3) {
					if (gris != true) {
						gris.visible = true;
						gris.x = 174.7;
						gris.y = 37.5;
					}
				} else
				if (fig == 4) {
					if (celeste != true) {
						celeste.visible = true;
						celeste.x = 174.7;
						celeste.y = 37.5;
					}
				} else
				if (fig == 5) {
					if (azul != true) {
						azul.visible = true;
						azul.x = 149.7;
						azul.y = 37.5;
					}
				} else
				if (fig == 6) {
					if (verde != true) {
						verde.visible = true;
						verde.x = 174.7;
						verde.y = 37.5;
					}
				}
			}
			addEventListener(Event.ENTER_FRAME, mostrarfig);
			function cubo1(event: Event) {
				cubo.y += 5;
				if (cubo.y > 566) {
					cubo.y = 0;
				}
				if (Nfigura.visible != false) {
					if (Nfigura.y > 462) {
						addChild(Nfigura);
						Nfigura.y = 37.5;
						Nfigura.x = 299.7;
					}
				}
			}
			addEventListener(Event.ENTER_FRAME, cubo1);
			function figurascai(event: Event): void {
				if (rojo.visible != false) {
					rojo.y++;
					if (rojo.y > 462) {
						rojo.visible = false
						fig = Math.random() * 6;
					}
				}
				if (amarillo.visible != false) {
					amarillo.y++;
					if (amarillo.y > 487) {
						amarillo.visible = false
						fig = Math.random() * 6;
					}
				}
				if (rosa.visible != false) {
					rosa.y++;
					if (rosa.y > 487) {
						rosa.visible = false
						fig = Math.random() * 6;
					}
				}
				if (gris.visible != false) {
					gris.y++;
					if (gris.y > 512) {
						gris.visible = false
						fig = Math.random() * 6;
					}
				}
				if (celeste.visible != false) {
					celeste.y++;
					if (celeste.y > 512) {
						celeste.visible = false
						fig = Math.random() * 6;
					}
				}
				if (azul.visible != false) {
					azul.y++;
					if (azul.y > 512) {
						azul.visible = false
						fig = Math.random() * 6;
					}
				}
				if (verde.visible != false) {
					verde.y++;
					if (verde.y > 512) {
						verde.visible = false
						fig = Math.random() * 6;
					}
				}
			}
			addEventListener(Event.ENTER_FRAME, figurascai);
		}

		public function portada() {
			var cancionp: SoundChannel = c1.play(); //Comienza la primera canción
			var poli: Tween = new Tween(poli, "y", Strong.easeOut, -50, 0, 3, true);
			//var siguiente: Tween = new Tween(siguiente, "y", Strong.easeOut, 700, 489.7, 3, true);
			var mat: Tween = new Tween(mat, "x", Strong.easeOut, -500, 41, 3, true);
			var mate: Tween = new Tween(mate, "x", Strong.easeOut, 900, 41, 3, true);
			var mae: Tween = new Tween(mae, "x", Strong.easeOut, -500, 41, 3, true);
			var nom: Tween = new Tween(nom, "x", Strong.easeOut, -500, 41, 3, true);
			var maes: Tween = new Tween(maes, "x", Strong.easeOut, 900, 41, 3, true);
			var matr: Tween = new Tween(matr, "x", Strong.easeOut, 900, 628.55, 3, true);
			var nom1: Tween = new Tween(nom1, "x", Strong.easeOut, -500, 41, 3, true);
			var nom2: Tween = new Tween(nom2, "x", Strong.easeOut, -500, 41, 3, true);
			var mat1: Tween = new Tween(mat1, "x", Strong.easeOut, 900, 621.95, 3, true);
			var mat2: Tween = new Tween(mat2, "x", Strong.easeOut, 900, 621.95, 3, true);
			function siguiente1(event: MouseEvent) {
				gotoAndStop(2); //Ir al fotograma 2
				cancionp.stop();
			}
			siguiente.addEventListener(MouseEvent.CLICK, siguiente1);
		}
	}
}