#obtener frase
frase = gets.chomp

CAP_MARK = "$$$"

def frase_separada_ordenada(frase)

	#separación de frase
	frase_separada = frase.split()

	#array sin signos de puntuación
	frase_separada_limpia = []

	#variables de puntuación
	punto = "."
	coma = ","
	exclamacion = "!"
	interrogacion = "?"

	#eliminar signos de puntuación
	for palabra in frase_separada
		if (palabra.include?(punto))
			palabra = palabra.delete(punto)
		end

		if (palabra.include?(coma))
			palabra = palabra.delete(coma)
		end

		if (palabra.include?(exclamacion))
			palabra = palabra.delete(exclamacion)
		end

		if (palabra.include?(interrogacion))
			palabra = palabra.delete(interrogacion)
		end

		frase_separada_limpia << palabra
	end

	comparar_palabras(frase_separada_limpia)

end

def comparar_palabras(frase_separada_limpia)

	indexes = []
	for palabra in frase_separada_limpia
		if (palabra[0] == palabra[0].capitalize)
			index = frase_separada_limpia.index(palabra)

			indexes << index

			frase_separada_limpia[index] = frase_separada_limpia[index].downcase
		end	
	end

	for index in indexes
        frase_separada_limpia[index] += CAP_MARK
    end

	frase_separada_limpia = frase_separada_limpia.sort

    for palabra in frase_separada_limpia
        if (palabra.include?(CAP_MARK))
            index = frase_separada_limpia.index(palabra)
            palabra = palabra.capitalize
            palabra = palabra.delete(CAP_MARK)
            frase_separada_limpia[index] = palabra
        end
    end

    frase_separada_limpia
end

puts frase_separada_ordenada(frase)