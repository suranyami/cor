defmodule Cor.Rgb do
  import Hexate, only: [:encode]
  defstruct r: 0.0, g: 0.0, b: 0.0

  def red,   do: %Cor.Rgb{r: 1.0, g: 0.0, b: 0.0}
  def green, do: %Cor.Rgb{r: 0.0, g: 1.0, b: 0.0}
  def blue,  do: %Cor.Rgb{r: 0.0, g: 0.0, b: 1.0}

  def as_percent(color) do
    %Cor.Rgb{r: color.r * 100, g: color.g * 100, b: color.b * 100}
  end

  def as_bytes(color) do
    %Cor.Rgb{r: color.r * 255, g: color.g * 255, b: color.b * 255}
  end

  def html(color) do
    "\##{hex_digits color.r}#{hex_digits color.g}#{hex_digits color.b}"
  end

  def hex_digits(num) do
    num * 255
    |> Hexate.encode 2
  end

  @doc """
  Converts a float from 0.0 to 1.0 into the range 0..255

  ## Example
      iex> Cor.Rgb.as_byte(1.0)
      255
  """
  def as_byte(float) do
    round(float * 255.0)
  end
end
