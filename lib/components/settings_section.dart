import 'package:flutter/material.dart';
import 'package:nsuns/utils/consts.dart';
import 'package:nsuns/utils/decimal_text_input_formatter.dart';
import 'package:nsuns/utils/decorators.dart';

class SettingsSection extends StatelessWidget {
  final String units;
  final num? rounding;
  final Map progression;
  final String template;
  final Function setUnits;
  final Function setRounding;
  final Function setProgression;
  final Function setTemplate;
  const SettingsSection({
    required this.units,
    required this.rounding,
    required this.progression,
    required this.template,
    required this.setUnits,
    required this.setRounding,
    required this.setProgression,
    required this.setTemplate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: headingStyle,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: 'Units'),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'kg',
              child: Text('kg'),
            ),
            DropdownMenuItem(
              value: 'lb',
              child: Text('lb'),
            ),
          ],
          value: units,
          onChanged: (value) {
            setUnits(value);
          },
          onSaved: (newValue) {
            setUnits(newValue);
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: 'Rounding'),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: '1.25',
              child: Text('1.25'),
            ),
            DropdownMenuItem(
              value: '2.5',
              child: Text('2.5'),
            ),
            DropdownMenuItem(
              value: '5',
              child: Text('5'),
            ),
          ],
          value: rounding.toString(),
          onChanged: (value) {
            setRounding(value);
          },
          onSaved: (newValue) {
            setRounding(newValue);
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: dropdownDecorator(labelText: 'Template'),
          isExpanded: true,
          items: [
            ...templates.keys.map(
              (templateName) => DropdownMenuItem(
                value: templateName,
                child: Text(templateName),
              ),
            )
          ],
          value: template,
          onChanged: (value) {
            setRounding(value);
          },
          onSaved: (newValue) {
            setRounding(newValue);
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: textFieldDecorator(labelText: "Progression 0-1 reps"),
          keyboardType: TextInputType.number,
          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
          initialValue: progression['0-1'].toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a progression ammount';
            }
            return null;
          },
          onChanged: (value) {
            setProgression(
                {...progression, '0-1': num.tryParse(value.toString())});
          },
          onSaved: (newValue) {
            setProgression(
                {...progression, '0-1': num.tryParse(newValue.toString())});
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: textFieldDecorator(labelText: "Progression 2-3 reps"),
          keyboardType: TextInputType.number,
          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
          initialValue: progression['2-3'].toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a progression ammount';
            }
            return null;
          },
          onChanged: (value) {
            setProgression(
                {...progression, '2-3': num.tryParse(value.toString())});
          },
          onSaved: (newValue) {
            setProgression(
                {...progression, '2-3': num.tryParse(newValue.toString())});
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: textFieldDecorator(labelText: "Progression 4-5 reps"),
          keyboardType: TextInputType.number,
          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
          initialValue: progression['4-5'].toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a progression ammount';
            }
            return null;
          },
          onChanged: (value) {
            setProgression(
                {...progression, '4-5': num.tryParse(value.toString())});
          },
          onSaved: (newValue) {
            setProgression(
                {...progression, '4-5': num.tryParse(newValue.toString())});
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: textFieldDecorator(labelText: "Progression 6+ reps"),
          keyboardType: TextInputType.number,
          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
          initialValue: progression['6+'].toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a progression ammount';
            }
            return null;
          },
          onChanged: (value) {
            setProgression(
                {...progression, '6+': num.tryParse(value.toString())});
          },
          onSaved: (newValue) {
            setProgression(
                {...progression, '6+': num.tryParse(newValue.toString())});
          },
        ),
      ],
    );
  }
}
