# Curso GO

- [Curso GO](#curso-go)
	- [Comandos útiles](#comandos-útiles)
	- [Snippets](#snippets)
		- [Variables y tipos de datos](#variables-y-tipos-de-datos)
		- [Operadores aritméticos](#operadores-aritméticos)
		- [Retos 1](#retos-1)
		- [Paquete fmt](#paquete-fmt)
		- [Funciones en go](#funciones-en-go)
		- [For loops](#for-loops)
		- [Retos 2 - Cuenta regresiva usando go](#retos-2---cuenta-regresiva-usando-go)
		- [Operadores lógicos](#operadores-lógicos)
		- [Retos 3 - Validar si es par o inpar y validar usuario y contraseña](#retos-3---validar-si-es-par-o-inpar-y-validar-usuario-y-contraseña)
		- [Usando el operador switch](#usando-el-operador-switch)
		- [Defer , break & continue](#defer--break--continue)
		- [Arrays & slices](#arrays--slices)
		- [Retos 4 - Palíndromo](#retos-4---palíndromo)
		- [Maps](#maps)
		- [Structs - como las clases de los otros lenguajes](#structs---como-las-clases-de-los-otros-lenguajes)
		- [Channels](#channels)
		- [Manejador de paquetes `go get`](#manejador-de-paquetes-go-get)

## Comandos útiles

|         Comando             |             Función                         |
|-----------------------------|---------------------------------------------|
|go build `<ruta del paquete>`| Construir el binario del paquete            |
|`./<nombre del binario>`     | Correr el paquete creado                    |
|`go run <ruta del paquete>`  | Permite correr el paquete sin hacer el build|

## Snippets

### Variables y tipos de datos

```go
package main

import "fmt"

func main()  {
	// Declaración de constantes
	const pi float64 = 3.1416
	const pi2 = 3.1416
	fmt.Println("pi:", pi2)
	fmt.Println("pi2: ", pi2)

	// Declaración de variables enteras (int)
	base := 12
	var altura int = 14
	var area int

	fmt.Println(base, altura, area)

	// Declaración de ZERO values

	var a int
	var b float64
	var c string
	var d bool

	fmt.Println(a, b, c, d)

	// Area de un cuadrado
	const baseCuadrado = 10
	areaCuadrado := baseCuadrado * baseCuadrado
	fmt.Println(areaCuadrado)
}
```

### Operadores aritméticos

```go
package main

import "fmt"

func main()  {

	x := 10
	y := 50

	// Suma
	result := x+y
	fmt.Println("Suma:",result)

	// Resta 
	result = y-x
	fmt.Println("Resta:",result)

	// Multiplicación
	result = x*y
	fmt.Println("Multiplicación:",result)

	// División
	result = y/x
	fmt.Println("División:",result)

	// Módulo
	result = y%x
	fmt.Println("Módulo:",result)

	// Incremental 
	x++
	fmt.Println("Incremental:", x)
	// Decremental 
	x--
	fmt.Println("Decremental:", x)

}
```

### Retos 1
```go
package main

import "fmt"

func main()  {

	/* Retos
	Calcular el área de:
	Rectángulo
	Trapecio
	Círculo
	*/

	/* Aŕea del Rectángulo
		Fórmula = b*h
	*/
	baseRectangulo := 6
	alturaRectangulo := 10

	fmt.Println("Área Rectángulo:",baseRectangulo*alturaRectangulo)

	/* Aŕea del Trapecio
		Fórmula = h * a+b/2
	*/
	alturaTrapecio := 5
	aTrapecio := 3
	bTrapecio := 8
	areaTrapecio := alturaTrapecio * (aTrapecio+bTrapecio)/2
	fmt.Println("Área Trapecio:",areaTrapecio)

	/* Aŕea del Círculo 
		Fórmula = pi * r**2
	*/
	pi := 3.1416
	radioCirculo := 2
	areaCirculo := pi * (float64(radioCirculo)*float64(radioCirculo))
	fmt.Println("Área Círculo:",areaCirculo)
}
```

### Paquete fmt

```go
package main

import "fmt"

func main()  {

	// Declaración de variables

	helloMsg := "Hello"
	goMsg := "Go"

	//Println
	fmt.Println(helloMsg, goMsg)

	//Printf 
	nombre := "Platzi"
	cursos := 500
	fmt.Printf("%s tiene más de %d cursos\n", nombre, cursos)

	// Sprintf
	message := fmt.Sprintf("%s tiene más de %d cursos\n", nombre, cursos)
	fmt.Println(message)

	// Tipo de datos
	fmt.Printf("helloMsg: %T\n", helloMsg)

}
```

### Funciones en go 

```go
package main

import "fmt"

func simplePrint(msg string)  {
	fmt.Println(msg)
}

func moreArgs(a, b int, c string)  {
	fmt.Println(a,b,c)
}

func sum(a,b int) int {
	return a + b
}

func doubleReturn(a int) (c,d int) {
	return a, a*2
}

func main()  {

	simpleMsg := "3 GO!" 
	simplePrint(simpleMsg)
	moreArgs(1,2,simpleMsg)
	fmt.Println(sum(2,2))
	val1, val2 := doubleReturn(2)
	fmt.Println(val1, val2)
}


```

### For loops
```go
package main

import "fmt"

func main()  {
	// For (rangos)
	for i := 0; i <= 5; i++ {
		fmt.Println(i)
	}
	// For while
	counter := 0
	for counter < 5 {
		fmt.Println(counter)
		counter++
	}

	// For forever (loop infinito)
	counterForEver := 0
	for {
		fmt.Println(counterForEver)
		counterForEver++
	}
}
```

### Retos 2 - Cuenta regresiva usando go
```go
package main

import "fmt"

func main()  {

	// Reto: cuenta regresiva usando for
	counter := 5
	fmt.Println("Cuenta regresiva usando GO:")
	for counter > 0 {
		fmt.Println(counter)
		counter--
	}

}
```

### Operadores lógicos

```go
package main

import "fmt"


func main()  {

	val1 := 1
	val2 := 2

	if val2 == 1 {
		fmt.Printf("Es %d\n", val1)
	} else {
		fmt.Printf("No es %d es %d \n", val1, val2)
	}

	// With and
	if val1 ==1 && val2 == 2 {
		fmt.Println("Es cierto")
	}

	// With or
	if val1 ==1 || val2 == 3 {
		fmt.Println("Es cierto, OR")
	}

}
```

### Retos 3 - Validar si es par o inpar y validar usuario y contraseña

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"syscall"
	"golang.org/x/crypto/ssh/terminal"
)

func isOdd(numToCheck int) bool {
	if numToCheck % 2 == 0 {
		return false
	} else {
		return true
	}
}

func evenChecker()  {
	
	fmt.Println("Ingresa un número: ")
	
	var usrNum int
	fmt.Scanln(&usrNum)
	if isOdd(usrNum) {
		fmt.Printf("El número %d es impar\n", usrNum)
	} else {
		fmt.Printf("El número %d es par\n", usrNum)
	}
}


func usrValidator() {
	
	allowedUsr := "test"
	allowedPass := string("securepass00")
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Ingresa tu usuario: ")
	username, _ := reader.ReadString('\n')
	fmt.Print("Ingresa tu contraseña: ")
	bytePass, _ := terminal.ReadPassword(syscall.Stdin)
	password := string(bytePass)
	
	username = strings.TrimSpace(username)
	password = strings.TrimSpace(password)

	if username == allowedUsr && password == allowedPass {
		fmt.Print("\nUsuario autorizado\n")
	} else {
		fmt.Print("\nOpps! No tienes permisos para ver esta información\n")
	}

}

func main()  {
	/* Reto 1 : Revisar si el número dado por el usuario es par o no */
	evenChecker()
	/* Reto 2 : Validar si un usuario y contraseña está autorizado para acceder a una platadorma */
	usrValidator()

}
```

### Usando el operador switch

```go
package main

import "fmt"



func main()  {

	/* Switch */

	switch mod := 4 % 2; mod {
	case 0:
		fmt.Println("Es par")
	default:
		fmt.Println("Es impar")
	}

	/* Sin condición */

	val := 50
	switch {
	case val > 100:
		fmt.Println("Es mayor a 100")
	case val < 0:
		fmt.Println("Es menor a 0")
	default:
		fmt.Println("Error! intenta de nuevo")
	}
}
```


### Defer , break & continue

```go
package main

import "fmt"


func main()  {

	/* Defer 
	ejecuta la última función antes de que la función muera. 
	Es una buena práctica para cerrar conexiones y optimizar recursos */
	defer fmt.Println("GO!")
	fmt.Println("Hola")
	for i := 0; i < 10; i++ {
		fmt.Println(i)
		if i == 2 {
			fmt.Println("Es 2")
			/* Continue 
			Cuando una condición dada en un ciclo se cumpla, pero 
			queramos que el bucle continúe
			*/
			continue
		}
		if i== 7 {
			/* Break
			Cuando ocurre una condición determinada y queremos que el
			código no continúe
			*/
			break
		}
	}
}
```

### Arrays & slices

```go
package main

import "fmt"


func main()  {

	/* Array [SON INMUTABLES]
	len - cuántos elementos hay en el array
	cap - tamaño máximo del array
	*/
	var array [4]int
	array[0] = 1
	array[1] = 2
	fmt.Println(array, len(array), cap(array))

	/* Slices [SON MUTABLES]
	No es necesario indicar la cantidad de valores que debe tener
	*/

	slice := []int{0,1,2,3,4,5,6,7,8,9}
	fmt.Println(slice, len(slice), cap(slice))

	/* Métodos del slice */
	fmt.Println(slice[0])
	fmt.Println(slice[:3])
	fmt.Println(slice[2:4])
	fmt.Println(slice[4:])

	/* Append */
	slice = append(slice, 10)
	fmt.Println(slice)

	/* Append lista */
	newSlice := []int{11,12,13}
	slice = append(slice, newSlice...)
	fmt.Println(slice)
}
```

### Retos 4 - Palíndromo

```go
package main

import (
	"fmt"
	"strings"
)


func isPalindrome(text string) bool {
	var textReverse string
	/* Reto: validar que si el texto contiene 
	mayúsculas igual siga validando el palíndromo. */
	text = strings.ToLower(text) // Pasamos el texto a minúsculas
	text = strings.ReplaceAll(" ", text, text) // Eliminamos los espacios
	for i := len(text) - 1; i >= 0; i-- {
		textReverse += string(text[i])
	}
	
	if text == textReverse {
		return true
	} else {
		return false
	}

}

func main()  {

	/* Recorrer slices */
	/* slice := []string{"hola", "golang"}
	for _, v := range slice {
		fmt.Println(v)
	} */

	
	fmt.Println(isPalindrome("Anita lava la tina"))
}
```

### Maps

```go
package main

import "fmt"


func main()  {
	/* Maps */
	m := make(map[string]int)

	m["Cristian"] = 14
	m["Stitch"] = 2

	fmt.Println(m)

	/* Recorrer el map */

	for i,v := range m {
		fmt.Println(i,v)
	}

	/* Encontrar un valor */
	val := m["Cristian"]
	fmt.Println(val)
}
```

### Structs - como las clases de los otros lenguajes

```go
package main

import "fmt"

type car struct {
	brand string
	year int
}


func main()  {

	myCar := car{brand: "Renault", year: 2020}
	fmt.Println(myCar)

	var otherCar car
	otherCar.brand = "Honda"
	fmt.Println(otherCar)
}
```

### Channels

```go
package main

import "fmt"


func say(text string, c chan<- string)  {
	c <- text

}

func main()  {
	/* Channels */
	c := make(chan string, 2)

	fmt.Println("Hello")

	go say("Bye", c)

	fmt.Println(<-c)
}
```


### Manejador de paquetes `go get`

```bash
go get golang.org/x/tour
```

Lista curada de paquetes de GO https://awesome-go.com/