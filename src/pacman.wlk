import wollok.game.*

object pacman {
	var property vidas = 3
	var property maxFila = 18
	var property maxColumna = 28
	var property position = game.origin()
	var property image = "pacman.png"

	method arriba(){
		if(position.y() <=  maxFila){	
			position = position.up(1)
		} else{
			position = game.at(position.x(),0)
		}
	}
	method abajo(){
		if(position.y() > 0){	
			position = position.down(1)
		} else{
			position = game.at(position.x(),maxFila+1)
		}
	}
	method izq(){
		if(position.x() > 0){	
			position = position.left(1)
		} else{
			position = game.at(maxColumna+1,position.y())
		}
	}
	method der(){
		if(position.x() <= maxColumna){	
			position = position.right(1)
		} else{
			position = game.at(0,position.y())
		}
	}
	method chocarCon(rival){
		self.perderVida()
		position = game.origin() 
		rival.position(game.center())
	}
	method perderVida(){
		vidas -= 1
	}
}




object fantasma{
	var property maxFila = 18
	var property maxColumna = 28
	var property image = "rival2.png"
	var property position = game.at(3,3)
	method arriba(){
		if(position.y() <=  maxFila){	
			position = position.up(1)
		} else{
			position = game.at(position.x(),0)
		}
	}
	method abajo(){
		if(position.y() > 0){	
			position = position.down(1)
		} else{
			position = game.at(position.x(),maxFila+1)
		}
	}
	method izq(){
		if(position.x() > 0){	
			position = position.left(1)
		} else{
			position = game.at(maxColumna+1,position.y())
		}
	}
	method der(){
		if(position.x() <= maxColumna){	
			position = position.right(1)
		} else{
			position = game.at(0,position.y())
		}
	}
	method chocarCon(rival){
		rival.position(game.origin())
		self.position(game.center())
	}
	method acercarseA(personaje){
		var posPacman = personaje.position()
		var newX = position.x() + 
					if(posPacman.x() > position.x()) {1} else if(posPacman.x() < position.x()) {-1} else {0}
		var newY = position.y() + 
					if(posPacman.y() > position.y()) {1} else if(posPacman.y() < position.y()) {-1} else {0}
					
		position = game.at(newX,newY)
	}
}