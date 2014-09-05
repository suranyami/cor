defmodule Cor.Rgb do
  defstruct r: 0.0, g: 0.0, b: 0.0

  def red,   do: %Cor.Rgb{r: 1.0, g: 0.0, b: 0.0}
  def green, do: %Cor.Rgb{r: 0.0, g: 1.0, b: 0.0}
  def blue,  do: %Cor.Rgb{r: 0.0, g: 0.0, b: 1.0}
end
