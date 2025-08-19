import 'package:flutter/material.dart';
import 'package:flutter_showcase/features/common/common.dart';

/// Auth strategy toggle button widget
class AuthStrategyToggleButton extends StatelessWidget {
  /// constructor
  const AuthStrategyToggleButton({required this.authStrategy, required this.onPressed, super.key});

  /// authentication strategy
  final AuthenticationStrategy authStrategy;

  /// onPressed callback
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: AuthenticationStrategy.values.map((p) => p == authStrategy).toList(),
      onPressed: onPressed,
      children: AuthenticationStrategy.values
          .map(
            (v) => Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    v.label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: v.hasImplemented ? null : Colors.grey,
                    ),
                  ),
                ),
                if (!v.hasImplemented)
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: Text(
                      'TODO',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        // fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          )
          .toList(),
    );
  }
}
