defmodule Condition do
    defmacro lest(expression, options) do
        quote do
            if !unquote(expression), unquote(options)
        end
    end
    
end
