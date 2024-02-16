import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatItem({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,horizontal: 12,),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
            if (!isMe) ProfileContainer(isMe: isMe),
            if (!isMe) const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(15),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.60,
              ),
              decoration: BoxDecoration(
                color: isMe
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                  bottomLeft: Radius.circular(isMe ? 15 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 15),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color:isMe ?Theme.of(context).colorScheme.onSecondary :Theme.of(context).colorScheme.onTertiary,

                ),
              ),
            ),
            if (isMe) const SizedBox(width: 15),
            if (isMe) ProfileContainer(isMe: isMe),
          ],
      ),
    ); // Row
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isMe ?Icons.person : Icons.computer ,
        color: isMe ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onTertiary ,
      ),
    );
  }
}
