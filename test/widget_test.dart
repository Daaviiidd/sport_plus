import 'package:flutter_test/flutter_test.dart';
import 'package:sport_plus/main.dart';

void main() {
  testWidgets('Pantalla principal muestra botones',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SportPlusApp());

    expect(find.text('Registrar Estado Emocional'), findsOneWidget);
    expect(find.text('Técnicas de Relajación'), findsOneWidget);
    expect(find.text('Ver Reportes'), findsOneWidget);
    expect(find.text('Panel de Entrenador'), findsOneWidget);
  });
}
