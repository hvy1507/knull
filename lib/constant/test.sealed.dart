sealed class Shape {
  const Shape();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);
}
