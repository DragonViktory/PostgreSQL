CREATE TYPE type_mood
AS ENUM(
	'happy',
	'relaxed',
	'stressed',
	'sad'
);
ALTER TABLE minions_info
ADD COlUMN mood type_mood;
